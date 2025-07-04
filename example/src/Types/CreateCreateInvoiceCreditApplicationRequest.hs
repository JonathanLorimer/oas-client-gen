{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateCreateInvoiceCreditApplicationRequest where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.CreateInvoiceCreditApplication (CreateInvoiceCreditApplication)
import Types.LinkedInvoices (LinkedInvoices)

data CreateCreateInvoiceCreditApplicationRequest = CreateCreateInvoiceCreditApplicationRequest
  { invoiceCreditApplication :: CreateInvoiceCreditApplication
  , responseMode :: Text
  }
  deriving (Show, Eq)

instance FromJSON CreateCreateInvoiceCreditApplicationRequest where
  parseJSON = withObject "CreateCreateInvoiceCreditApplicationRequest" $ \obj -> do
    invoiceCreditApplication <- obj .: "invoice_credit_application"
    responseMode <- obj .: "response_mode"
    pure $ CreateCreateInvoiceCreditApplicationRequest{..}

instance ToJSON CreateCreateInvoiceCreditApplicationRequest where
  toJSON CreateCreateInvoiceCreditApplicationRequest{..} =
    object [
      "invoice_credit_application" .= invoiceCreditApplication,
      "response_mode" .= responseMode
    ]
