{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateConnectionBody6 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data CreateConnectionBody6 = CreateConnectionBody6
  { oauthAccessToken :: Text
  , oauthRefreshToken :: Text
  , storeUrl :: Text
  }
  deriving (Show, Eq)

instance FromJSON CreateConnectionBody6 where
  parseJSON = withObject "CreateConnectionBody6" $ \obj -> do
    oauthAccessToken <- obj .: "oauth_access_token"
    oauthRefreshToken <- obj .: "oauth_refresh_token"
    storeUrl <- obj .: "store_url"
    pure $ CreateConnectionBody6{..}

instance ToJSON CreateConnectionBody6 where
  toJSON CreateConnectionBody6{..} =
    object [
      "oauth_access_token" .= oauthAccessToken,
      "oauth_refresh_token" .= oauthRefreshToken,
      "store_url" .= storeUrl
    ]
