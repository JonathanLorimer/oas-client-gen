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
import Data.Functor ((<&>))
import Data.List.NonEmpty (NonEmpty (..))
import Data.List.NonEmpty qualified as NE
import Data.Map.Strict (Map)
import Data.Map.Strict qualified as M
import Data.Maybe (fromMaybe, mapMaybe)
import Data.Set (Set)
import Data.Set qualified as S
import Data.Text (Text)
import Data.Text qualified as T
import Network.HTTP.Types (StdMethod (..))
import OAS.Generator.Endpoint (Endpoint (..))
import OAS.Generator.OASType (OASPrimTy (..), OASType (..), SchemaResult (..))
import OAS.Schema.Response (ResponseType (..))
import Text.Casing

-- | Generate Haskell source code for an endpoint definition
generateEndpointDefinition :: Endpoint -> Text
generateEndpointDefinition endpoint =
  let
    endpointPathPart = generateEndpointNamePathPart endpoint.path
    endpointMethodPart = generateEndpointNameMethodPart endpoint.method
    endpointName = endpointMethodPart <> endpointPathPart
    methodDef = T.pack $ show endpoint.method
    pathParamTyName = endpointPathPart <> "PathParam"
    p = generatePathDef endpoint.path pathParamTyName
    requestTypeDef = generateRequestTypeDef endpoint.requestType
    responseTypeDef = generateResponseTypeDef endpoint.responseType

    typeSignature = generateTypeSignature pathParamTyName endpoint endpointName
  in
    maybe "" (<> "\n\n") p.paramType
      <> T.unlines
        [ typeSignature
        , endpointName <> " = Endpoint"
        , prettyRecord
            2
            ( "method = "
                <> methodDef
                  :| [ "path = " <> p.pathDef
                     , "requestBody = " <> requestTypeDef
                     , "responseBody = " <> responseTypeDef
                     ]
            )
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
  { pathText :: Text
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
          { pathText = "const $ fold\n" <> pieceList
          , paramType = Nothing
          }
      Just vs ->
        PathDef
          { pathText = "\\pathParams -> fold\n" <> pieceList
          , paramType =
              Just . fold $
                [ "data "
                , pathName <> "PathParams"
                , " = "
                , pathName <> "PathParams\n"
                , prettyRecord 2 $ (<> " :: Text") <$> vs
                ]
          }

-- TODO: Move these to pretty printing utils file
quoted :: Text -> Text
quoted t = "\"" <> t <> "\""

prettyRecord :: Int -> NonEmpty Text -> Text
prettyRecord = prettySurround '{' '}'

prettyListWith :: Int -> [Text] -> Text
prettyListWith indent ts = case NE.nonEmpty ts of
  Nothing -> T.replicate indent " " <> "[]"
  Just ne -> prettySurround '[' ']' indent ne

prettySurround :: Char -> Char -> Int -> NonEmpty Text -> Text
prettySurround beg end indent = \case
  single :| [] ->
    fold
      [ indentText
      , T.cons beg " "
      , single
      , T.snoc " " end
      ]
  x :| xs ->
    fold
      [ indentText <> T.cons beg " " <> x <> "\n"
      , foldMap (\t -> indentText <> ", " <> t <> "\n") xs
      , T.snoc indentText end
      ]
 where
  indentText = T.replicate indent " "

-- TODO: Fix below here

-- | Generate the Haskell code for the request type
generateRequestTypeDef :: Maybe OASType -> Text
generateRequestTypeDef Nothing = "Nothing"
generateRequestTypeDef (Just oasType) =
  "Just (" <> typeToEncoder oasType <> ")"

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
generateResponseTypeDef :: Map ResponseType SchemaResult -> Text
generateResponseTypeDef responseTypes =
  if M.null responseTypes
    then "const Nothing"
    else
      "\\statusCode -> case statusCode of\n"
        <> T.intercalate "\n" (map responseTypeCaseDef (M.toList responseTypes))
        <> "\n    _ -> Nothing"

-- | Generate a case definition for a response type
responseTypeCaseDef :: (ResponseType, SchemaResult) -> Text
responseTypeCaseDef (responseType, schemaResult) =
  let
    statusCodeMatch = case responseType of
      Default -> "    _" -- Default case
      ForStatus code -> "    " <> T.pack (show code)

    decoderExpr = case schemaResult of
      EmptySchema -> "Just (const ())"
      Type oasType -> "Just (" <> typeToDecoder oasType <> ")"
  in
    statusCodeMatch <> " -> " <> decoderExpr

-- | Convert an OASType to its decoder expression
typeToDecoder :: OASType -> Text
typeToDecoder oasType = case oasType of
  OASPrim primType -> primTypeDecoder primType
  OASArray innerType -> "decodeList (" <> typeToDecoder innerType <> ")"
  OASObject record -> "decode" <> record.constructor
  OASMaybe innerType -> "decodeMaybe (" <> typeToDecoder innerType <> ")"
  OASEnum typeName _ -> "decode" <> typeName

-- | Get decoder for primitive types
primTypeDecoder :: OASPrimTy -> Text
primTypeDecoder = \case
  PrimString -> "decodeText"
  PrimInt -> "decodeInt"
  PrimFloat -> "decodeFloat"
  PrimBool -> "decodeBool"

-- | Generate a type signature for an endpoint function
generateTypeSignature :: Text -> Endpoint -> Text -> Text
generateTypeSignature pathParamTyName endpoint name =
  let
    -- Determine request and response types from the endpoint
    reqType = case endpoint.requestType of
      Nothing -> "a" -- No request type, use a generic type variable
      Just (OASObject record) -> record.constructor
      Just (OASEnum typeName _) -> typeName
      _ -> "a" -- Fall back to generic type for primitive or complex types
    respType = determineResponseType endpoint.responseType

    -- Create the type signature
    signature =
      if isNothing endpoint.requestType
        then name <> " :: Endpoint () " <> respType -- No request type
        else name <> " :: Endpoint " <> reqType <> " " <> respType
  in
    signature

-- | Determine the main response type from the response map
determineResponseType :: Map ResponseType SchemaResult -> Text
determineResponseType respMap =
  case M.lookup (ForStatus 200) respMap <|> M.lookup (ForStatus 201) respMap <|> M.lookup Default respMap of
    Just (Type (OASObject record)) -> record.constructor
    Just (Type (OASEnum typeName _)) -> typeName
    _ -> "b" -- Fall back to generic type variable

-- | Collect all types used in endpoints for imports
collectTypesFromEndpoints :: [Endpoint] -> Set OASType
collectTypesFromEndpoints endpoints =
  let
    -- Collect request types
    requestTypes = S.fromList $ catMaybes $ map (.requestType) endpoints

    -- Collect response types
    responseTypes =
      S.fromList $
        concat $
          map (mapMaybe extractType . M.elems . (.responseType)) endpoints
  in
    S.union requestTypes
