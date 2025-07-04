{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ExchangeTokenBody where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data ExchangeTokenBody = ExchangeTokenBody
  { clientId :: Text
  , publicToken :: Text
  , secret :: Text
  }
  deriving (Show, Eq)

instance FromJSON ExchangeTokenBody where
  parseJSON = withObject "ExchangeTokenBody" $ \obj -> do
    clientId <- obj .: "client_id"
    publicToken <- obj .: "public_token"
    secret <- obj .: "secret"
    pure $ ExchangeTokenBody{..}

instance ToJSON ExchangeTokenBody where
  toJSON ExchangeTokenBody{..} =
    object [
      "client_id" .= clientId,
      "public_token" .= publicToken,
      "secret" .= secret
    ]
