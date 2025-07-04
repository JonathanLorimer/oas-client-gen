{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateBillCreditApplicationResponse where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AsyncResponse8 (AsyncResponse8)
import Types.BillCreditApplication (BillCreditApplication)
import Types.CreateBillCreditApplicationResponse1 (CreateBillCreditApplicationResponse1)

data CreateBillCreditApplicationResponse
  = CreateBillCreditApplicationResponseVariant1 CreateBillCreditApplicationResponse
  | CreateBillCreditApplicationResponseVariant2 CreateBillCreditApplicationResponse1
  deriving (Show, Eq)

instance FromJSON CreateBillCreditApplicationResponse where
  parseJSON value = asum
    [ CreateBillCreditApplicationResponseVariant1 <$> parseJSON value
    , CreateBillCreditApplicationResponseVariant2 <$> parseJSON value
    ]

instance ToJSON CreateBillCreditApplicationResponse where
  toJSON = \case
    CreateBillCreditApplicationResponseVariant1 v1 -> object ["type" .= ("variant1" :: Text), "value" .= v1]
    CreateBillCreditApplicationResponseVariant2 v2 -> object ["type" .= ("variant2" :: Text), "value" .= v2]
