{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateConnectionBody9 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data CreateConnectionBody9 = CreateConnectionBody9
  { oauthClientId :: Text
  , oauthClientSecret :: Text
  , oauthRefreshToken :: Text
  }
  deriving (Show, Eq)

instance FromJSON CreateConnectionBody9 where
  parseJSON = withObject "CreateConnectionBody9" $ \obj -> do
    oauthClientId <- obj .: "oauth_client_id"
    oauthClientSecret <- obj .: "oauth_client_secret"
    oauthRefreshToken <- obj .: "oauth_refresh_token"
    pure $ CreateConnectionBody9{..}

instance ToJSON CreateConnectionBody9 where
  toJSON CreateConnectionBody9{..} =
    object [
      "oauth_client_id" .= oauthClientId,
      "oauth_client_secret" .= oauthClientSecret,
      "oauth_refresh_token" .= oauthRefreshToken
    ]
