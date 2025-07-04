{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.BillingAddress where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data BillingAddress = BillingAddress
  { address1 :: Text
  , address2 :: Text
  , city :: Text
  , countryCode :: Text
  , email :: Maybe Text
  , firstName :: Text
  , lastName :: Text
  , phone :: Maybe Text
  , postalCode :: Text
  , region :: Text
  }
  deriving (Show, Eq)

instance FromJSON BillingAddress where
  parseJSON = withObject "BillingAddress" $ \obj -> do
    address1 <- obj .: "address1"
    address2 <- obj .: "address2"
    city <- obj .: "city"
    countryCode <- obj .: "country_code"
    email <- obj .: "email"
    firstName <- obj .: "first_name"
    lastName <- obj .: "last_name"
    phone <- obj .: "phone"
    postalCode <- obj .: "postal_code"
    region <- obj .: "region"
    pure $ BillingAddress{..}

instance ToJSON BillingAddress where
  toJSON BillingAddress{..} =
    object [
      "address1" .= address1,
      "address2" .= address2,
      "city" .= city,
      "country_code" .= countryCode,
      "email" .= email,
      "first_name" .= firstName,
      "last_name" .= lastName,
      "phone" .= phone,
      "postal_code" .= postalCode,
      "region" .= region
    ]
