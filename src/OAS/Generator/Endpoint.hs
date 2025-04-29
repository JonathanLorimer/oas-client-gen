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

import Control.Monad (join)
import Data.Bifunctor (Bifunctor)
import Data.ByteString.Lazy (ByteString)
import Data.Functor.Contravariant
import Data.Map (Map)
import Data.Map qualified as M
import Data.Maybe (catMaybes)
import Data.Profunctor (Profunctor (..))
import Data.Text (Text)
import Data.Traversable (for)
import Network.HTTP.Types
import OAS.Generator.Environment (Environment (..), fromRef, fromRefRec)
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
import OAS.Schema.Response

data ResponseTypeInfo
  = UnaryType ResponseType SchemaResult
  | SumType {tyName :: Text, resultMap :: Map ResponseType (SchemaResult, Text)}
  deriving (Eq, Ord, Show)

-- TODO: Implement
toResponseTypeDef :: ResponseTypeInfo -> Maybe Text
toResponseTypeDef = undefined

data Endpoint = Endpoint
  { method :: StdMethod
  , path :: Text
  , requestType :: Maybe OASType
  , responseType :: ResponseTypeInfo
  }
  deriving (Eq, Ord, Show)

fromPath :: (Monad m) => Environment -> Text -> Path -> SchemaT m [Endpoint]
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

      responseType <-
        M.mapMaybe id <$> for op.responses \res ->
          traverse
            (fromOrRefSchema env.schemas op.summary)
            (M.lookup "application/json" res.content >>= (.schema))

      pure
        Endpoint
          { method = stdMethod
          , path = url
          , requestType =
              requestType >>= \case
                EmptySchema -> Nothing
                (Type oasTy) -> Just oasTy
          , responseType = responseType
          }
