{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ExchangeTokenResponse where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data ExchangeTokenResponse = ExchangeTokenResponse
  { accessToken :: Text
  , connectionId :: Text
  , isReady :: Bool
  , platform :: Text
  , storeUniqueName :: Text
  }
  deriving (Show, Eq)

instance FromJSON ExchangeTokenResponse where
  parseJSON = withObject "ExchangeTokenResponse" $ \obj -> do
    accessToken <- obj .: "access_token"
    connectionId <- obj .: "connection_id"
    isReady <- obj .: "is_ready"
    platform <- obj .: "platform"
    storeUniqueName <- obj .: "store_unique_name"
    pure $ ExchangeTokenResponse{..}

instance ToJSON ExchangeTokenResponse where
  toJSON ExchangeTokenResponse{..} =
    object [
      "access_token" .= accessToken,
      "connection_id" .= connectionId,
      "is_ready" .= isReady,
      "platform" .= platform,
      "store_unique_name" .= storeUniqueName
    ]
