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
import OAS.Generator.Endpoint (Endpoint (..), ResponseTypeInfo (..), toResponseTypeDef)
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
    endpointMethodPart = generateEndpointNameMethodPart endpoint.method
    endpointName = endpointMethodPart <> endpointPathPart

    -- Method
    methodDef = T.pack $ show endpoint.method

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
                           , "requestBody = " <> requestDef
                           , "responseBody = " <> responseDef
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

data PathPart = Static Text | Variable Text
  deriving (Eq, Ord, Show)

fromPathParts :: Text -> (PathPart -> a) -> [a]
fromPathParts path f =
  let
    pathWithoutLeadingSlash = fromMaybe path $ T.stripPrefix "/" path
    -- Split path by / and convert to camelCase
    pathParts = filter (not . T.null) $ T.split (== '/') pathWithoutLeadingSlash
  in
    pathParts <&> \part ->
      case T.stripPrefix "{" >=> T.stripSuffix "}" $ part of
        Nothing -> f $ Static part
        Just var -> f $ Variable var

-- | Generate a camelCase name for the endpoint based on method and path
generateEndpointNamePathPart :: Text -> Text
generateEndpointNamePathPart path =
  let
    anyToPascal = T.pack . toPascal . fromAny . T.unpack
    normalizedPathName = fold $ fromPathParts path \case
      Static p -> anyToPascal p
      Variable v -> "By" <> anyToPascal v
  in
    if T.null normalizedPathName
      then "Root"
      else normalizedPathName

generateEndpointNameMethodPart :: StdMethod -> Text
generateEndpointNameMethodPart = T.toLower . T.pack . show

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
generateRequestDef (Just oasType) = typeToEncoder oasType

-- | Convert an OASType to its encoder expression
typeToEncoder :: OASType -> Text
typeToEncoder oasType = case oasType of
  OASPrim primType -> primTypeEncoder primType
  OASArray innerType -> "encodeList " <> typeToEncoder innerType
  OASObject record -> "encode" <> record.constructor
  OASMaybe innerType -> "encodeMaybe (" <> typeToEncoder innerType <> ")"
  OASEnum typeName _ -> "encode" <> typeName

-- | Get encoder for primitive types
primTypeEncoder :: OASPrimTy -> Text
primTypeEncoder = \case
  PrimString -> "encodeText"
  PrimInt -> "encodeInt"
  PrimFloat -> "encodeFloat"
  PrimBool -> "encodeBool"

-- | Generate the Haskell code for the response type
generateResponseDef :: ResponseTypeInfo -> Text
generateResponseDef (UnaryType _ EmptySchema) = "\\_ _ -> ()"
generateResponseDef (UnaryType Default _) = "\\_ -> first DefaultCaseParseError . decodeEither"
generateResponseDef (UnaryType n _) =
  let
    n' = T.pack $ show n
  in
    T.unlines
      [ "\\case"
      , n' <> " -> \bs -> first StatusCaseParseError " <> n' <> " bs $ decodeEither bs"
      , "s -> Left . UnexpectedResponse s"
      ]
generateResponseDef SumType{resultMap = responseTypes} =
  let
    withDefaultCase (res, ctor) = "_ -> const " <> schemaResultDecoder ctor res
    errorDefaultCase = "s -> Left . UnexpectedResponse s"
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
        "\\case"
          <> "\n\t\t"
          <> statusCases
          <> "\n\t\t"
          <> defaultCase

schemaResultDecoder :: Text -> SchemaResult -> Text
schemaResultDecoder ctor = \case
  EmptySchema -> "pure " <> ctor
  Type _ -> "bimap DefaultCaseParseError " <> ctor <> " . decodeEither"

-- | Generate a case definition for a response type
statusCaseDecoder :: Natural -> Text -> Text
statusCaseDecoder status ctor =
  let
    s = T.pack (show status)
  in
    fold
      [ s
      , " -> \bs ->"
      , " bimap (StatusCaseParseError " <> s <> " bs)" <> ctor
      , " $ decodeEither bs"
      ]

-- | Determine the main response type from the response map
-- determineResponseType :: Map ResponseType SchemaResult -> Text
-- determineResponseType respMap =
--   case M.lookup (ForStatus 200) respMap <|> M.lookup (ForStatus 201) respMap <|> M.lookup Default respMap of
--     Just (Type (OASObject record)) -> record.constructor
--     Just (Type (OASEnum typeName _)) -> typeName
--     _ -> "b" -- Fall back to generic type variable

-- -- | Collect all types used in endpoints for imports
-- collectTypesFromEndpoints :: [Endpoint] -> Set OASType
-- collectTypesFromEndpoints endpoints =
--   let
--     -- Collect request types
--     requestTypes = S.fromList $ catMaybes $ map (.requestType) endpoints

--     -- Collect response types
--     responseTypes =
--       S.fromList $
--         concat $
--           map (mapMaybe extractType . M.elems . (.responseType)) endpoints
--   in
--     S.union requestTypes
