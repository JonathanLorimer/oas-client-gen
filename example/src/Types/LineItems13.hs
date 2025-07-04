{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.LineItems13 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AdditionalFields29 (AdditionalFields29)
import Types.Item9 (Item9)
import Types.LinkedSalesOrder (LinkedSalesOrder)

data LineItems13 = LineItems13
  { accountId :: Text
  , additionalFields :: AdditionalFields29
  , classId :: Text
  , description :: Text
  , discountAmount :: Double
  , discountItemId :: Text
  , item :: Item9
  , locationId :: Text
  , taxRateId :: Text
  , totalAmount :: Double
  }
  deriving (Show, Eq)

instance FromJSON LineItems13 where
  parseJSON = withObject "LineItems13" $ \obj -> do
    accountId <- obj .: "account_id"
    additionalFields <- obj .: "additional_fields"
    classId <- obj .: "class_id"
    description <- obj .: "description"
    discountAmount <- obj .: "discount_amount"
    discountItemId <- obj .: "discount_item_id"
    item <- obj .: "item"
    locationId <- obj .: "location_id"
    taxRateId <- obj .: "tax_rate_id"
    totalAmount <- obj .: "total_amount"
    pure $ LineItems13{..}

instance ToJSON LineItems13 where
  toJSON LineItems13{..} =
    object [
      "account_id" .= accountId,
      "additional_fields" .= additionalFields,
      "class_id" .= classId,
      "description" .= description,
      "discount_amount" .= discountAmount,
      "discount_item_id" .= discountItemId,
      "item" .= item,
      "location_id" .= locationId,
      "tax_rate_id" .= taxRateId,
      "total_amount" .= totalAmount
    ]
