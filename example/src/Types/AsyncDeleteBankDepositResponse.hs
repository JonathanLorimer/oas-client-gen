{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AsyncDeleteBankDepositResponse where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AsyncDeleteBankDepositResponse1 (AsyncDeleteBankDepositResponse1)
import Types.AsyncResponse3 (AsyncResponse3)

data AsyncDeleteBankDepositResponse
  = AsyncDeleteBankDepositResponseVariant1 AsyncDeleteBankDepositResponse
  | AsyncDeleteBankDepositResponseVariant2 AsyncDeleteBankDepositResponse1
  deriving (Show, Eq)

instance FromJSON AsyncDeleteBankDepositResponse where
  parseJSON value = asum
    [ AsyncDeleteBankDepositResponseVariant1 <$> parseJSON value
    , AsyncDeleteBankDepositResponseVariant2 <$> parseJSON value
    ]

instance ToJSON AsyncDeleteBankDepositResponse where
  toJSON = \case
    AsyncDeleteBankDepositResponseVariant1 v1 -> object ["type" .= ("variant1" :: Text), "value" .= v1]
    AsyncDeleteBankDepositResponseVariant2 v2 -> object ["type" .= ("variant2" :: Text), "value" .= v2]
