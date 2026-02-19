-- |
--   Module      : OAS.Generator.FileSystem.Endpoint
--   Description : Functions for generating Haskell code from OAS types
--   Copyright   : (c) Jonathan Lorimer, 2025
--   License     : BSD3
--   Maintainer  : jonathanlorimer@pm.me
--
--   This module provides functions to generate Haskell source code from the
--   intermediate representation of OpenAPI schemas. The main goal is to generate
--   endpoint definitions that can be used in client libraries.
module OAS.Generator.FileSystem.Endpoint where

import Control.Monad ((>=>))
import Data.Foldable
import Data.Functor (($>), (<&>))
import Data.List.NonEmpty (NonEmpty (..))
import Data.List.NonEmpty qualified as NE
import Data.Map.Strict (Map)
import Data.Map.Strict qualified as M
import Data.Maybe (catMaybes, fromMaybe, mapMaybe)
import Data.Set (Set)
import Data.Set qualified as S
import Data.Text (Text)
import Data.Text qualified as T
import Network.HTTP.Types (StdMethod (..))
import Numeric.Natural (Natural)
import OAS.Generator.Endpoint
  ( Endpoint (..)
  , PathPart (..)
  , ResponseTypeInfo (..)
  , fromPathParts
  , generateEndpointNameMethodPart
  , generateEndpointNamePathPart
  , toResponseTypeDef
  )
import OAS.Generator.FileSystem.PrettyPrint
import OAS.Generator.FileSystem.Utils (getTypeReference)
import OAS.Generator.OASType (OASPrimTy (..), OASType (..), Record (..), SchemaResult (..))
import OAS.Schema.Response (ResponseType (..))
import Text.Casing

-- | Generate Haskell source code for an endpoint definition
generateEndpointDefinition :: Endpoint -> Text
generateEndpointDefinition endpoint =
  let
    -- Endpoint name
    endpointPathPart = generateEndpointNamePathPart endpoint.path
    endpointMethodPart = T.toLower $ generateEndpointNameMethodPart endpoint.method
    endpointName = endpointMethodPart <> endpointPathPart

    -- Method
    methodDef = "HTTP." <> T.pack (show endpoint.method)

    -- Path
    pathParamTyName = endpointPathPart <> "PathParams"
    p = generatePathDef endpoint.path pathParamTyName

    -- Request
    requestDef = generateRequestDef endpoint.requestType
    requestType = maybe "()" getTypeReference endpoint.requestType

    -- Response
    responseDef = generateResponseDef endpoint.responseType
    responseTypeName = case endpoint.responseType of
      UnaryType _ EmptySchema -> "()"
      UnaryType _ (Type oasType) -> getTypeReference oasType
      SumType{tyName} -> tyName
    responseTypeDef = toResponseTypeDef endpoint.responseType

    -- Type
    typeSignature =
      generateTypeSignature
        (fromMaybe "()" (pathParamTyName <$ p.paramType))
        requestType
        responseTypeName
  in
    T.intercalate "\n\n" $
      catMaybes
        [ p.paramType
        , responseTypeDef
        , Just $
            T.unlines
              [ endpointName <> " :: " <> typeSignature
              , endpointName <> " = Endpoint"
              , prettyRecord
                  2
                  ( "method = "
                      <> methodDef
                        :| [ "path = " <> p.pathDef
                           , "toRequestBody = " <> requestDef
                           , "fromResponseBody = " <> responseDef
                           ]
                  )
              ]
        ]

-- | Generate a type signature for an endpoint function
generateTypeSignature :: Text -> Text -> Text -> Text
generateTypeSignature pathType reqType resType =
  T.intercalate
    " "
    [ "Endpoint"
    , pathType
    , reqType
    , resType
    ]

data PathDef = PathDef
  { pathDef :: Text
  , paramType :: Maybe Text
  }

generatePathDef :: Text -> Text -> PathDef
generatePathDef path pathName =
  let
    parts = fromPathParts path id
    vars = flip mapMaybe parts \case
      Static _ -> Nothing
      Variable v -> Just v
    renderedPieces =
      parts <&> \case
        Static s -> quoted $ "/" <> s
        Variable v -> quoted "/" <> " <> " <> "pathParams." <> v
    pieceList = prettyListWith 6 renderedPieces
  in
    case NE.nonEmpty vars of
      Nothing ->
        PathDef
          { pathDef = "const $ fold\n" <> pieceList
          , paramType = Nothing
          }
      Just vs ->
        PathDef
          { pathDef = "\\pathParams -> fold\n" <> pieceList
          , paramType =
              Just . fold $
                [ "data "
                , pathName
                , " = "
                , pathName <> "\n"
                , prettyRecord 2 $ (<> " :: Text") <$> vs
                ]
          }

-- | Generate the Haskell code for the request type
generateRequestDef :: Maybe OASType -> Text
generateRequestDef Nothing = "const L.empty"
generateRequestDef (Just oasType) = "A.encode"

-- | Generate the Haskell code for the response type
generateResponseDef :: ResponseTypeInfo -> Text
generateResponseDef (UnaryType _ EmptySchema) = "\\_ _ -> Right ()"
generateResponseDef (UnaryType Default _) = "\\status -> first (ParseError status . L8.pack) . A.eitherDecode"
generateResponseDef (UnaryType (ForStatus n) _) =
  let
    n' = T.pack $ show n
  in
    T.unlines
      [ "\\case"
      , "      "
          <> n'
          <> " -> \\bs -> first (ParseError "
          <> n'
          <> " . L8.pack) $ A.eitherDecode bs"
      , "      " <> "s -> \\bs -> Left $ UnexpectedResponse s bs"
      ]
generateResponseDef SumType{resultMap = responseTypes} =
  let
    withDefaultCase (res, ctor) = "s -> \\bs -> " <> schemaResultDecoderWithStatus "s" "bs" ctor res
    errorDefaultCase = "s -> \\bs -> Left $ UnexpectedResponse s bs"
    defaultCase = maybe errorDefaultCase withDefaultCase (M.lookup Default responseTypes)

    statusMap =
      M.foldrWithKey
        ( \key val acc -> case key of
            Default -> acc
            ForStatus s -> M.insert s val acc
        )
        M.empty
        responseTypes
    statusCases = T.intercalate "\n" (fmap (uncurry statusCaseDecoder) . M.toList . fmap snd $ statusMap)
  in
    if M.null responseTypes
      then "const Nothing"
      else
        "\\case\n"
          <> statusCases
          <> "\n"
          <> "      "
          <> defaultCase

schemaResultDecoderWithStatus :: Text -> Text -> Text -> SchemaResult -> Text
schemaResultDecoderWithStatus statusVar bsVar ctor = \case
  EmptySchema -> "pure " <> ctor
  Type _ -> "bimap (ParseError " <> statusVar <> " . L8.pack) " <> "(" <> ctor <> " . A.eitherDecode) $ " <> bsVar

-- | Generate a case definition for a response type
statusCaseDecoder :: Natural -> Text -> Text
statusCaseDecoder status ctor =
  let
    s = T.pack (show status)
  in
    fold
      [ "      "
      , s
      , " -> \\bs ->"
      , " bimap (ParseError " <> s <> " . L8.pack) " <> ctor
      , " $ A.eitherDecode bs"
      ]
