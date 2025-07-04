{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateVendor where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AdditionalFields40 (AdditionalFields40)
import Types.Addresses5 (Addresses5)
import Types.Subsidiaries5 (Subsidiaries5)

data CreateVendor = CreateVendor
  { additionalFields :: AdditionalFields40
  , addresses :: [Addresses5]
  , contactName :: Text
  , currencyCode :: Text
  , email :: Text
  , paymentTermsId :: Maybe Text
  , phone :: Text
  , registrationNumber :: Text
  , subsidiaries :: [Subsidiaries5]
  , taxNumber :: Text
  , vendorName :: Text
  , website :: Text
  }
  deriving (Show, Eq)

instance FromJSON CreateVendor where
  parseJSON = withObject "CreateVendor" $ \obj -> do
    additionalFields <- obj .: "additional_fields"
    addresses <- obj .: "addresses"
    contactName <- obj .: "contact_name"
    currencyCode <- obj .: "currency_code"
    email <- obj .: "email"
    paymentTermsId <- obj .: "payment_terms_id"
    phone <- obj .: "phone"
    registrationNumber <- obj .: "registration_number"
    subsidiaries <- obj .: "subsidiaries"
    taxNumber <- obj .: "tax_number"
    vendorName <- obj .: "vendor_name"
    website <- obj .: "website"
    pure $ CreateVendor{..}

instance ToJSON CreateVendor where
  toJSON CreateVendor{..} =
    object [
      "additional_fields" .= additionalFields,
      "addresses" .= addresses,
      "contact_name" .= contactName,
      "currency_code" .= currencyCode,
      "email" .= email,
      "payment_terms_id" .= paymentTermsId,
      "phone" .= phone,
      "registration_number" .= registrationNumber,
      "subsidiaries" .= subsidiaries,
      "tax_number" .= taxNumber,
      "vendor_name" .= vendorName,
      "website" .= website
    ]
