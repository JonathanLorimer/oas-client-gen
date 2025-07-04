{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Request where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)


data Request = Request
  { body :: Map Text Value
  , idempotencyKey :: Text
  , method :: Text
  , url :: Text
  }
  deriving (Show, Eq)

instance FromJSON Request where
  parseJSON = withObject "Request" $ \obj -> do
    body <- obj .: "body"
    idempotencyKey <- obj .: "idempotency_key"
    method <- obj .: "method"
    url <- obj .: "url"
    pure $ Request{..}

instance ToJSON Request where
  toJSON Request{..} =
    object [
      "body" .= body,
      "idempotency_key" .= idempotencyKey,
      "method" .= method,
      "url" .= url
    ]
