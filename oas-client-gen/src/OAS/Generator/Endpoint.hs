{-# LANGUAGE NamedFieldPuns #-}

-- |
--   Module      : OAS.Generator.Endpoint
--   Description : Types and functions for representing an "endpoint"
--   Copyright   : (c) Jonathan Lorimer, 2025
--   License     : BSD3
--   Maintainer  : jonathanlorimer@pm.me
--
--   The primary concern of this library is pulling endpoints out of the
--   open-api specification, so that we can generate a haskell client for
--   an api. This module, and specifically the 'Endpoint' type are supposed
--   to be an abstract representation that can be used to generate Haskell
--   source code.
module OAS.Generator.Endpoint where

import Control.Monad (join, (>=>))
import Control.Monad.IO.Class (MonadIO)
import Data.Bifunctor (Bifunctor)
import Data.ByteString.Lazy (ByteString)
import Data.Foldable (Foldable (..))
import Data.Functor ((<&>))
import Data.Functor.Contravariant
import Data.Map (Map)
import Data.Map qualified as M
import Data.Maybe (catMaybes, fromMaybe)
import Data.Profunctor (Profunctor (..))
import Data.Text (Text)
import Data.Text qualified as T
import Data.Traversable (for)
import Network.HTTP.Types
import OAS.Generator.Environment (Environment (..), fromRef, fromRefRec)
import OAS.Generator.FileSystem.Utils (getTypeReference)
import OAS.Generator.OASType
  ( OASType
  , SchemaResult (..)
  , SchemaT
  , filterEmptySchema
  , fromOrRefSchema
  , fromRefRecSchemaT
  )
import OAS.Schema.Header (MediaType (..))
import OAS.Schema.Path (Operation (..), Path (..))
import OAS.Schema.RequestBody
import OAS.Schema.Response (Response (..), ResponseType (..))
import Text.Casing (camel, fromAny, toPascal)

data ResponseTypeInfo
  = UnaryType ResponseType SchemaResult
  | SumType {tyName :: Text, resultMap :: Map ResponseType (SchemaResult, Text)}
  deriving (Eq, Ord, Show)

-- | Generate type definition for response types
toResponseTypeDef :: ResponseTypeInfo -> Maybe Text
toResponseTypeDef (UnaryType _ EmptySchema) = Nothing
toResponseTypeDef (UnaryType _ (Type _)) = Nothing -- Simple types don't need definitions
toResponseTypeDef (SumType tyName resultMap) =
  if M.null resultMap
    then Nothing
    else
      Just $
        fold
          [ "data "
          , tyName
          , " = "
          , T.intercalate "\n  | " (mkConNames <$> M.elems resultMap)
          , "\n  deriving (Eq, Show)"
          ]
 where
  mkConNames :: (SchemaResult, Text) -> Text
  mkConNames (EmptySchema, t) = t
  mkConNames (Type oasTy, t) = t <> " " <> getTypeReference oasTy

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
generateEndpointNameMethodPart = T.pack . show

data Endpoint = Endpoint
  { method :: StdMethod
  , path :: Text
  , requestType :: Maybe OASType
  , responseType :: ResponseTypeInfo
  }
  deriving (Eq, Ord, Show)

fromPath :: (MonadIO m) => Environment -> Text -> Path -> SchemaT m [Endpoint]
fromPath env url p =
  let
    operations =
      catMaybes
        [ (GET,) <$> p.get
        , (PUT,) <$> p.put
        , (POST,) <$> p.post
        , (DELETE,) <$> p.delete
        , (OPTIONS,) <$> p.options
        , (TRACE,) <$> p.trace
        ]
  in
    for operations \(stdMethod, op) -> do
      requestType <-
        join <$> for op.requestBody \orRef -> do
          rb <- fromRefRecSchemaT env.requestBodies orRef
          traverse
            (fromOrRefSchema env.schemas op.summary)
            (M.lookup "application/json" rb.content >>= (.schema))

      responseTypeMap <-
        M.mapMaybe id <$> for op.responses \res ->
          traverse
            (fromOrRefSchema env.schemas op.summary)
            (res.content >>= M.lookup "application/json" >>= (.schema))

      let
        method = stdMethod
        path = url
        endpointPathPart = generateEndpointNamePathPart path
        endpointMethodPart = T.toTitle . T.toLower $ generateEndpointNameMethodPart method
        endpointName = endpointMethodPart <> endpointPathPart
        responseTypeName = endpointName <> "Response"

        responseType = case M.toList responseTypeMap of
          [(respType, schemaResult)] -> UnaryType respType schemaResult
          multiple ->
            SumType responseTypeName $
              M.mapWithKey
                ( \k v ->
                    let
                      suffix = case k of
                        Default -> "Default"
                        ForStatus n -> "ForStatus" <> T.pack (show n)
                    in
                      (v, responseTypeName <> suffix)
                )
                responseTypeMap

      pure
        Endpoint
          { method
          , path
          , requestType =
              requestType >>= \case
                EmptySchema -> Nothing
                (Type oasTy) -> Just oasTy
          , responseType = responseType
          }
