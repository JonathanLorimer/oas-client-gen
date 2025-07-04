{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateConnectionBody2 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data CreateConnectionBody2 = CreateConnectionBody2
  { amazonAccessKeyId :: Text
  , amazonSecretAccessKey :: Text
  , amazonSellerRegion :: Text
  , amazonSellingPartnerRole :: Text
  , oauthClientId :: Text
  , oauthClientSecret :: Text
  , oauthRefreshToken :: Text
  }
  deriving (Show, Eq)

instance FromJSON CreateConnectionBody2 where
  parseJSON = withObject "CreateConnectionBody2" $ \obj -> do
    amazonAccessKeyId <- obj .: "amazon_access_key_id"
    amazonSecretAccessKey <- obj .: "amazon_secret_access_key"
    amazonSellerRegion <- obj .: "amazon_seller_region"
    amazonSellingPartnerRole <- obj .: "amazon_selling_partner_role"
    oauthClientId <- obj .: "oauth_client_id"
    oauthClientSecret <- obj .: "oauth_client_secret"
    oauthRefreshToken <- obj .: "oauth_refresh_token"
    pure $ CreateConnectionBody2{..}

instance ToJSON CreateConnectionBody2 where
  toJSON CreateConnectionBody2{..} =
    object [
      "amazon_access_key_id" .= amazonAccessKeyId,
      "amazon_secret_access_key" .= amazonSecretAccessKey,
      "amazon_seller_region" .= amazonSellerRegion,
      "amazon_selling_partner_role" .= amazonSellingPartnerRole,
      "oauth_client_id" .= oauthClientId,
      "oauth_client_secret" .= oauthClientSecret,
      "oauth_refresh_token" .= oauthRefreshToken
    ]
