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

data Endpoint = Endpoint
  { method :: StdMethod
  , path :: Text
  , requestType :: Maybe OASType
  , responseType :: Map ResponseType SchemaResult
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

-- This is the code to be generated
--
-- data Endpoint p req res = Endpoint
--   { method :: StdMethod
--   , path :: p -> Text
--   , toRequestBody :: req -> ByteString
--   , fromRequestBody :: Status -> ByteString -> Either Text res
--   }
--   deriving (Functor)

-- instance Profunctor (Endpoint p) where
--   dimap f g endpoint =
--     endpoint
--       { toRequestBody = endpoint.toRequestBody . f
--       , fromRequestBody = \s b -> g <$> endpoint.fromRequestBody s b
--       }
