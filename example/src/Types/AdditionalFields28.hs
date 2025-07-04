{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AdditionalFields28 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.Addresses3 (Addresses3)

data AdditionalFields28 = AdditionalFields28
  { addresses :: [Addresses3]
  , allowOnlineAchPayment :: Bool
  , allowOnlineCreditCardPayment :: Bool
  , billingEmail :: Text
  , departmentId :: Text
  , discountAmount :: Double
  , discountPercentage :: Double
  , internalMemo :: Text
  , locationId :: Text
  , poNumber :: Text
  , shipDate :: Text
  , shippingAmount :: Double
  , taxAmount :: Double
  , taxRateId :: Text
  }
  deriving (Show, Eq)

instance FromJSON AdditionalFields28 where
  parseJSON = withObject "AdditionalFields28" $ \obj -> do
    addresses <- obj .: "addresses"
    allowOnlineAchPayment <- obj .: "allow_online_ach_payment"
    allowOnlineCreditCardPayment <- obj .: "allow_online_credit_card_payment"
    billingEmail <- obj .: "billing_email"
    departmentId <- obj .: "department_id"
    discountAmount <- obj .: "discount_amount"
    discountPercentage <- obj .: "discount_percentage"
    internalMemo <- obj .: "internal_memo"
    locationId <- obj .: "location_id"
    poNumber <- obj .: "po_number"
    shipDate <- obj .: "ship_date"
    shippingAmount <- obj .: "shipping_amount"
    taxAmount <- obj .: "tax_amount"
    taxRateId <- obj .: "tax_rate_id"
    pure $ AdditionalFields28{..}

instance ToJSON AdditionalFields28 where
  toJSON AdditionalFields28{..} =
    object [
      "addresses" .= addresses,
      "allow_online_ach_payment" .= allowOnlineAchPayment,
      "allow_online_credit_card_payment" .= allowOnlineCreditCardPayment,
      "billing_email" .= billingEmail,
      "department_id" .= departmentId,
      "discount_amount" .= discountAmount,
      "discount_percentage" .= discountPercentage,
      "internal_memo" .= internalMemo,
      "location_id" .= locationId,
      "po_number" .= poNumber,
      "ship_date" .= shipDate,
      "shipping_amount" .= shippingAmount,
      "tax_amount" .= taxAmount,
      "tax_rate_id" .= taxRateId
    ]
