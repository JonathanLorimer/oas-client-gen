module OAS.Generator.Endpoints where

import Data.Bifunctor (Bifunctor)
import Data.ByteString.Lazy (ByteString)
import Data.Functor.Contravariant
import Data.Profunctor (Profunctor (..))
import Data.Text (Text)
import Network.HTTP.Types
import OAS.Generator.OASType (OASType)

data Endpoint = Endpoint
  { method :: StdMethod
  , path :: Text
  , requestType :: OASType
  , responseType :: OASType
  }

-- This is the code to be generated
--
-- data Endpoint req res = Endpoint
--   { method :: StdMethod
--   , path :: Text
--   , toRequestBody :: req -> ByteString
--   , fromRequestBody :: Status -> ByteString -> Either Text res
--   }
--   deriving (Functor)

-- instance Profunctor Endpoint where
--   dimap f g endpoint =
--     endpoint
--       { toRequestBody = endpoint.toRequestBody . f
--       , fromRequestBody = \s b -> g <$> endpoint.fromRequestBody s b
--       }
