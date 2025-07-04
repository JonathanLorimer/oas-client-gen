{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AccountingItemResponseWithConnection where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data AccountingItemResponseWithConnection = AccountingItemResponseWithConnection
  { connection :: Connection
  , item :: AccountingItem
  }
  deriving (Show, Eq)

instance FromJSON AccountingItemResponseWithConnection where
  parseJSON = withObject "AccountingItemResponseWithConnection" $ \obj -> do
    connection <- obj .: "connection"
    item <- obj .: "item"
    pure $ AccountingItemResponseWithConnection{..}

instance ToJSON AccountingItemResponseWithConnection where
  toJSON AccountingItemResponseWithConnection{..} =
    object [
      "connection" .= connection,
      "item" .= item
    ]
