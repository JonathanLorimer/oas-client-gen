{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateConnectionBody15 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data CreateConnectionBody15 = CreateConnectionBody15
  { consumerKey :: Text
  , consumerSecret :: Text
  , storeName :: Text
  , tokenId :: Text
  , tokenSecret :: Text
  }
  deriving (Show, Eq)

instance FromJSON CreateConnectionBody15 where
  parseJSON = withObject "CreateConnectionBody15" $ \obj -> do
    consumerKey <- obj .: "consumer_key"
    consumerSecret <- obj .: "consumer_secret"
    storeName <- obj .: "store_name"
    tokenId <- obj .: "token_id"
    tokenSecret <- obj .: "token_secret"
    pure $ CreateConnectionBody15{..}

instance ToJSON CreateConnectionBody15 where
  toJSON CreateConnectionBody15{..} =
    object [
      "consumer_key" .= consumerKey,
      "consumer_secret" .= consumerSecret,
      "store_name" .= storeName,
      "token_id" .= tokenId,
      "token_secret" .= tokenSecret
    ]
