{-# LANGUAGE DeriveFunctor #-}
{-# LANGUAGE OverloadedRecordDot #-}

module OAS.Base.Endpoint where

import Data.ByteString.Lazy (ByteString)
import Data.Profunctor.Types (Profunctor (..))
import Data.Text (Text)
import Network.HTTP.Types.Method (StdMethod)
import Numeric.Natural (Natural)

data FromResponseError
  = ParseError Natural ByteString
  | UnexpectedResponse Natural ByteString
  deriving (Eq, Ord, Show)

data Endpoint p req res = Endpoint
  { method :: StdMethod
  , path :: p -> Text
  , toRequestBody :: req -> ByteString
  , fromResponseBody :: Natural -> ByteString -> Either FromResponseError res
  }
  deriving (Functor)

instance Profunctor (Endpoint p) where
  dimap f g endpoint =
    endpoint
      { toRequestBody = endpoint.toRequestBody . f
      , fromResponseBody = \s b -> g <$> endpoint.fromResponseBody s b
      }
