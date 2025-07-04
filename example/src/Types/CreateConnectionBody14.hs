{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateConnectionBody14 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data CreateConnectionBody14 = CreateConnectionBody14
  { environment :: Text
  , oauthClientId :: Text
  , oauthClientSecret :: Text
  , oauthRefreshToken :: Text
  , realmId :: Text
  }
  deriving (Show, Eq)

instance FromJSON CreateConnectionBody14 where
  parseJSON = withObject "CreateConnectionBody14" $ \obj -> do
    environment <- obj .: "environment"
    oauthClientId <- obj .: "oauth_client_id"
    oauthClientSecret <- obj .: "oauth_client_secret"
    oauthRefreshToken <- obj .: "oauth_refresh_token"
    realmId <- obj .: "realm_id"
    pure $ CreateConnectionBody14{..}

instance ToJSON CreateConnectionBody14 where
  toJSON CreateConnectionBody14{..} =
    object [
      "environment" .= environment,
      "oauth_client_id" .= oauthClientId,
      "oauth_client_secret" .= oauthClientSecret,
      "oauth_refresh_token" .= oauthRefreshToken,
      "realm_id" .= realmId
    ]
