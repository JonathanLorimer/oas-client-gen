{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateConnectionBody16 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data CreateConnectionBody16 = CreateConnectionBody16
  { oauthClientId :: Text
  , oauthClientSecret :: Text
  , oauthRefreshToken :: Text
  , sellerId :: Text
  }
  deriving (Show, Eq)

instance FromJSON CreateConnectionBody16 where
  parseJSON = withObject "CreateConnectionBody16" $ \obj -> do
    oauthClientId <- obj .: "oauth_client_id"
    oauthClientSecret <- obj .: "oauth_client_secret"
    oauthRefreshToken <- obj .: "oauth_refresh_token"
    sellerId <- obj .: "seller_id"
    pure $ CreateConnectionBody16{..}

instance ToJSON CreateConnectionBody16 where
  toJSON CreateConnectionBody16{..} =
    object [
      "oauth_client_id" .= oauthClientId,
      "oauth_client_secret" .= oauthClientSecret,
      "oauth_refresh_token" .= oauthRefreshToken,
      "seller_id" .= sellerId
    ]
