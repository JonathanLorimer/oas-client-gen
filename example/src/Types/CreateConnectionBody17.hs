{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateConnectionBody17 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data CreateConnectionBody17 = CreateConnectionBody17
  { oauthClientId :: Text
  , oauthClientSecret :: Text
  , oauthRefreshToken :: Text
  , tenantId :: Text
  , userId :: Text
  }
  deriving (Show, Eq)

instance FromJSON CreateConnectionBody17 where
  parseJSON = withObject "CreateConnectionBody17" $ \obj -> do
    oauthClientId <- obj .: "oauth_client_id"
    oauthClientSecret <- obj .: "oauth_client_secret"
    oauthRefreshToken <- obj .: "oauth_refresh_token"
    tenantId <- obj .: "tenant_id"
    userId <- obj .: "user_id"
    pure $ CreateConnectionBody17{..}

instance ToJSON CreateConnectionBody17 where
  toJSON CreateConnectionBody17{..} =
    object [
      "oauth_client_id" .= oauthClientId,
      "oauth_client_secret" .= oauthClientSecret,
      "oauth_refresh_token" .= oauthRefreshToken,
      "tenant_id" .= tenantId,
      "user_id" .= userId
    ]
