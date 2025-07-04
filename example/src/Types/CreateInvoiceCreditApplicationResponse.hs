{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateInvoiceCreditApplicationResponse where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AsyncResponse23 (AsyncResponse23)
import Types.CreateInvoiceCreditApplicationResponse1 (CreateInvoiceCreditApplicationResponse1)
import Types.InvoiceCreditApplication (InvoiceCreditApplication)

data CreateInvoiceCreditApplicationResponse
  = CreateInvoiceCreditApplicationResponseVariant1 CreateInvoiceCreditApplicationResponse
  | CreateInvoiceCreditApplicationResponseVariant2 CreateInvoiceCreditApplicationResponse1
  deriving (Show, Eq)

instance FromJSON CreateInvoiceCreditApplicationResponse where
  parseJSON value = asum
    [ CreateInvoiceCreditApplicationResponseVariant1 <$> parseJSON value
    , CreateInvoiceCreditApplicationResponseVariant2 <$> parseJSON value
    ]

instance ToJSON CreateInvoiceCreditApplicationResponse where
  toJSON = \case
    CreateInvoiceCreditApplicationResponseVariant1 v1 -> object ["type" .= ("variant1" :: Text), "value" .= v1]
    CreateInvoiceCreditApplicationResponseVariant2 v2 -> object ["type" .= ("variant2" :: Text), "value" .= v2]
