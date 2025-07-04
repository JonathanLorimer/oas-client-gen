{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AsyncDeleteInvoiceResponse where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AsyncDeleteInvoiceResponse1 (AsyncDeleteInvoiceResponse1)
import Types.AsyncResponse29 (AsyncResponse29)

data AsyncDeleteInvoiceResponse
  = AsyncDeleteInvoiceResponseVariant1 AsyncDeleteInvoiceResponse
  | AsyncDeleteInvoiceResponseVariant2 AsyncDeleteInvoiceResponse1
  deriving (Show, Eq)

instance FromJSON AsyncDeleteInvoiceResponse where
  parseJSON value = asum
    [ AsyncDeleteInvoiceResponseVariant1 <$> parseJSON value
    , AsyncDeleteInvoiceResponseVariant2 <$> parseJSON value
    ]

instance ToJSON AsyncDeleteInvoiceResponse where
  toJSON = \case
    AsyncDeleteInvoiceResponseVariant1 v1 -> object ["type" .= ("variant1" :: Text), "value" .= v1]
    AsyncDeleteInvoiceResponseVariant2 v2 -> object ["type" .= ("variant2" :: Text), "value" .= v2]
