{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateConnectionBody4 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data CreateConnectionBody4 = CreateConnectionBody4
  { oauthAccessToken :: Text
  , oauthClientId :: Text
  , oauthClientSecret :: Text
  , storeUrl :: Text
  }
  deriving (Show, Eq)

instance FromJSON CreateConnectionBody4 where
  parseJSON = withObject "CreateConnectionBody4" $ \obj -> do
    oauthAccessToken <- obj .: "oauth_access_token"
    oauthClientId <- obj .: "oauth_client_id"
    oauthClientSecret <- obj .: "oauth_client_secret"
    storeUrl <- obj .: "store_url"
    pure $ CreateConnectionBody4{..}

instance ToJSON CreateConnectionBody4 where
  toJSON CreateConnectionBody4{..} =
    object [
      "oauth_access_token" .= oauthAccessToken,
      "oauth_client_id" .= oauthClientId,
      "oauth_client_secret" .= oauthClientSecret,
      "store_url" .= storeUrl
    ]
