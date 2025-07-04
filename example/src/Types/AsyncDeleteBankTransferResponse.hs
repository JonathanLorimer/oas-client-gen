{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AsyncDeleteBankTransferResponse where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AsyncDeleteBankTransferResponse1 (AsyncDeleteBankTransferResponse1)
import Types.AsyncResponse7 (AsyncResponse7)

data AsyncDeleteBankTransferResponse
  = AsyncDeleteBankTransferResponseVariant1 AsyncDeleteBankTransferResponse
  | AsyncDeleteBankTransferResponseVariant2 AsyncDeleteBankTransferResponse1
  deriving (Show, Eq)

instance FromJSON AsyncDeleteBankTransferResponse where
  parseJSON value = asum
    [ AsyncDeleteBankTransferResponseVariant1 <$> parseJSON value
    , AsyncDeleteBankTransferResponseVariant2 <$> parseJSON value
    ]

instance ToJSON AsyncDeleteBankTransferResponse where
  toJSON = \case
    AsyncDeleteBankTransferResponseVariant1 v1 -> object ["type" .= ("variant1" :: Text), "value" .= v1]
    AsyncDeleteBankTransferResponseVariant2 v2 -> object ["type" .= ("variant2" :: Text), "value" .= v2]
