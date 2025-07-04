{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateConnectionBody12 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data CreateConnectionBody12 = CreateConnectionBody12
  { oauthClientId :: Text
  , oauthClientSecret :: Text
  , oauthRefreshToken :: Text
  }
  deriving (Show, Eq)

instance FromJSON CreateConnectionBody12 where
  parseJSON = withObject "CreateConnectionBody12" $ \obj -> do
    oauthClientId <- obj .: "oauth_client_id"
    oauthClientSecret <- obj .: "oauth_client_secret"
    oauthRefreshToken <- obj .: "oauth_refresh_token"
    pure $ CreateConnectionBody12{..}

instance ToJSON CreateConnectionBody12 where
  toJSON CreateConnectionBody12{..} =
    object [
      "oauth_client_id" .= oauthClientId,
      "oauth_client_secret" .= oauthClientSecret,
      "oauth_refresh_token" .= oauthRefreshToken
    ]
