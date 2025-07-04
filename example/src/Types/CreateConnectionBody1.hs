{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateConnectionBody1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data CreateConnectionBody1 = CreateConnectionBody1
  { oauthAccessToken :: Text
  , oauthClientId :: Text
  , oauthClientSecret :: Text
  , storeUrl :: Text
  }
  deriving (Show, Eq)

instance FromJSON CreateConnectionBody1 where
  parseJSON = withObject "CreateConnectionBody1" $ \obj -> do
    oauthAccessToken <- obj .: "oauth_access_token"
    oauthClientId <- obj .: "oauth_client_id"
    oauthClientSecret <- obj .: "oauth_client_secret"
    storeUrl <- obj .: "store_url"
    pure $ CreateConnectionBody1{..}

instance ToJSON CreateConnectionBody1 where
  toJSON CreateConnectionBody1{..} =
    object [
      "oauth_access_token" .= oauthAccessToken,
      "oauth_client_id" .= oauthClientId,
      "oauth_client_secret" .= oauthClientSecret,
      "store_url" .= storeUrl
    ]
