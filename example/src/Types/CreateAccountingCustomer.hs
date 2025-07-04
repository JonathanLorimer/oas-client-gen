{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateAccountingCustomer where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AdditionalFields17 (AdditionalFields17)
import Types.Addresses1 (Addresses1)

data CreateAccountingCustomer = CreateAccountingCustomer
  { additionalFields :: AdditionalFields17
  , addresses :: [Addresses1]
  , contactName :: Text
  , customerName :: Text
  , email :: Text
  , phone :: Text
  , subsidiaryId :: Text
  }
  deriving (Show, Eq)

instance FromJSON CreateAccountingCustomer where
  parseJSON = withObject "CreateAccountingCustomer" $ \obj -> do
    additionalFields <- obj .: "additional_fields"
    addresses <- obj .: "addresses"
    contactName <- obj .: "contact_name"
    customerName <- obj .: "customer_name"
    email <- obj .: "email"
    phone <- obj .: "phone"
    subsidiaryId <- obj .: "subsidiary_id"
    pure $ CreateAccountingCustomer{..}

instance ToJSON CreateAccountingCustomer where
  toJSON CreateAccountingCustomer{..} =
    object [
      "additional_fields" .= additionalFields,
      "addresses" .= addresses,
      "contact_name" .= contactName,
      "customer_name" .= customerName,
      "email" .= email,
      "phone" .= phone,
      "subsidiary_id" .= subsidiaryId
    ]
