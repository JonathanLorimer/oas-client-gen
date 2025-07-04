{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateInvoiceResponse where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AsyncResponse28 (AsyncResponse28)
import Types.CreateInvoiceResponse1 (CreateInvoiceResponse1)

data CreateInvoiceResponse
  = CreateInvoiceResponseVariant1 CreateInvoiceResponse
  | CreateInvoiceResponseVariant2 CreateInvoiceResponse1
  deriving (Show, Eq)

instance FromJSON CreateInvoiceResponse where
  parseJSON value = asum
    [ CreateInvoiceResponseVariant1 <$> parseJSON value
    , CreateInvoiceResponseVariant2 <$> parseJSON value
    ]

instance ToJSON CreateInvoiceResponse where
  toJSON = \case
    CreateInvoiceResponseVariant1 v1 -> object ["type" .= ("variant1" :: Text), "value" .= v1]
    CreateInvoiceResponseVariant2 v2 -> object ["type" .= ("variant2" :: Text), "value" .= v2]
