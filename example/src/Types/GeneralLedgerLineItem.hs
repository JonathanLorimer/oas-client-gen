{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.GeneralLedgerLineItem where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data GeneralLedgerLineItem = GeneralLedgerLineItem
  { accountId :: Maybe Text
  , items :: [GeneralLedgerLineItem]
  , name :: Text
  , platformId :: Maybe Text
  , prevLineItem :: GeneralLedgerLineItem
  , value :: Text
  }
  deriving (Show, Eq)

instance FromJSON GeneralLedgerLineItem where
  parseJSON = withObject "GeneralLedgerLineItem" $ \obj -> do
    accountId <- obj .: "account_id"
    items <- obj .: "items"
    name <- obj .: "name"
    platformId <- obj .: "platform_id"
    prevLineItem <- obj .: "prevLineItem"
    value <- obj .: "value"
    pure $ GeneralLedgerLineItem{..}

instance ToJSON GeneralLedgerLineItem where
  toJSON GeneralLedgerLineItem{..} =
    object [
      "account_id" .= accountId,
      "items" .= items,
      "name" .= name,
      "platform_id" .= platformId,
      "prevLineItem" .= prevLineItem,
      "value" .= value
    ]
