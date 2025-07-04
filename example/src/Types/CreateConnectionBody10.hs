{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateConnectionBody10 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data CreateConnectionBody10 = CreateConnectionBody10
  { country :: Text
  , oauthAccessToken :: Text
  , oauthClientId :: Text
  , oauthClientSecret :: Text
  , oauthRefreshToken :: Text
  }
  deriving (Show, Eq)

instance FromJSON CreateConnectionBody10 where
  parseJSON = withObject "CreateConnectionBody10" $ \obj -> do
    country <- obj .: "country"
    oauthAccessToken <- obj .: "oauth_access_token"
    oauthClientId <- obj .: "oauth_client_id"
    oauthClientSecret <- obj .: "oauth_client_secret"
    oauthRefreshToken <- obj .: "oauth_refresh_token"
    pure $ CreateConnectionBody10{..}

instance ToJSON CreateConnectionBody10 where
  toJSON CreateConnectionBody10{..} =
    object [
      "country" .= country,
      "oauth_access_token" .= oauthAccessToken,
      "oauth_client_id" .= oauthClientId,
      "oauth_client_secret" .= oauthClientSecret,
      "oauth_refresh_token" .= oauthRefreshToken
    ]
