{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ListAdsAccountResponseWithConnection where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.AdsAccount (AdsAccount)

data ListAdsAccountResponseWithConnection = ListAdsAccountResponseWithConnection
  { accounts :: [AdsAccount]
  , connection :: Connection
  , nextCursor :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON ListAdsAccountResponseWithConnection where
  parseJSON = withObject "ListAdsAccountResponseWithConnection" $ \obj -> do
    accounts <- obj .: "accounts"
    connection <- obj .: "connection"
    nextCursor <- obj .: "next_cursor"
    pure $ ListAdsAccountResponseWithConnection{..}

instance ToJSON ListAdsAccountResponseWithConnection where
  toJSON ListAdsAccountResponseWithConnection{..} =
    object [
      "accounts" .= accounts,
      "connection" .= connection,
      "next_cursor" .= nextCursor
    ]
