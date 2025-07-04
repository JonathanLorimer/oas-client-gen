{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateBankTransferResponse where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AsyncResponse6 (AsyncResponse6)
import Types.CreateBankTransferResponse1 (CreateBankTransferResponse1)

data CreateBankTransferResponse
  = CreateBankTransferResponseVariant1 CreateBankTransferResponse
  | CreateBankTransferResponseVariant2 CreateBankTransferResponse1
  deriving (Show, Eq)

instance FromJSON CreateBankTransferResponse where
  parseJSON value = asum
    [ CreateBankTransferResponseVariant1 <$> parseJSON value
    , CreateBankTransferResponseVariant2 <$> parseJSON value
    ]

instance ToJSON CreateBankTransferResponse where
  toJSON = \case
    CreateBankTransferResponseVariant1 v1 -> object ["type" .= ("variant1" :: Text), "value" .= v1]
    CreateBankTransferResponseVariant2 v2 -> object ["type" .= ("variant2" :: Text), "value" .= v2]
