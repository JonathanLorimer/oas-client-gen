{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateBillCreditMemoResponse where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AsyncResponse9 (AsyncResponse9)
import Types.CreateBillCreditMemoResponse1 (CreateBillCreditMemoResponse1)

data CreateBillCreditMemoResponse
  = CreateBillCreditMemoResponseVariant1 CreateBillCreditMemoResponse
  | CreateBillCreditMemoResponseVariant2 CreateBillCreditMemoResponse1
  deriving (Show, Eq)

instance FromJSON CreateBillCreditMemoResponse where
  parseJSON value = asum
    [ CreateBillCreditMemoResponseVariant1 <$> parseJSON value
    , CreateBillCreditMemoResponseVariant2 <$> parseJSON value
    ]

instance ToJSON CreateBillCreditMemoResponse where
  toJSON = \case
    CreateBillCreditMemoResponseVariant1 v1 -> object ["type" .= ("variant1" :: Text), "value" .= v1]
    CreateBillCreditMemoResponseVariant2 v2 -> object ["type" .= ("variant2" :: Text), "value" .= v2]
