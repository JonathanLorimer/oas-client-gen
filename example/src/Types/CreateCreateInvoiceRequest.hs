{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateCreateInvoiceRequest where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AdditionalFields28 (AdditionalFields28)
import Types.AdditionalFields29 (AdditionalFields29)
import Types.Addresses3 (Addresses3)
import Types.CreateInvoice (CreateInvoice)
import Types.Item9 (Item9)
import Types.LineItems13 (LineItems13)
import Types.LinkedSalesOrder (LinkedSalesOrder)

data CreateCreateInvoiceRequest = CreateCreateInvoiceRequest
  { invoice :: CreateInvoice
  , responseMode :: Text
  }
  deriving (Show, Eq)

instance FromJSON CreateCreateInvoiceRequest where
  parseJSON = withObject "CreateCreateInvoiceRequest" $ \obj -> do
    invoice <- obj .: "invoice"
    responseMode <- obj .: "response_mode"
    pure $ CreateCreateInvoiceRequest{..}

instance ToJSON CreateCreateInvoiceRequest where
  toJSON CreateCreateInvoiceRequest{..} =
    object [
      "invoice" .= invoice,
      "response_mode" .= responseMode
    ]
