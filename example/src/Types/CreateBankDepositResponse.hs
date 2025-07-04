{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateBankDepositResponse where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AsyncResponse2 (AsyncResponse2)
import Types.CreateBankDepositResponse1 (CreateBankDepositResponse1)

data CreateBankDepositResponse
  = CreateBankDepositResponseVariant1 CreateBankDepositResponse
  | CreateBankDepositResponseVariant2 CreateBankDepositResponse1
  deriving (Show, Eq)

instance FromJSON CreateBankDepositResponse where
  parseJSON value = asum
    [ CreateBankDepositResponseVariant1 <$> parseJSON value
    , CreateBankDepositResponseVariant2 <$> parseJSON value
    ]

instance ToJSON CreateBankDepositResponse where
  toJSON = \case
    CreateBankDepositResponseVariant1 v1 -> object ["type" .= ("variant1" :: Text), "value" .= v1]
    CreateBankDepositResponseVariant2 v2 -> object ["type" .= ("variant2" :: Text), "value" .= v2]
