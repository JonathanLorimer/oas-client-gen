{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateConnectionBody13 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data CreateConnectionBody13 = CreateConnectionBody13
  { accountId :: Text
  , oauthAccessToken :: Text
  }
  deriving (Show, Eq)

instance FromJSON CreateConnectionBody13 where
  parseJSON = withObject "CreateConnectionBody13" $ \obj -> do
    accountId <- obj .: "account_id"
    oauthAccessToken <- obj .: "oauth_access_token"
    pure $ CreateConnectionBody13{..}

instance ToJSON CreateConnectionBody13 where
  toJSON CreateConnectionBody13{..} =
    object [
      "account_id" .= accountId,
      "oauth_access_token" .= oauthAccessToken
    ]
