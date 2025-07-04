{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.LineItems6 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AdditionalFields14 (AdditionalFields14)
import Types.Item4 (Item4)

data LineItems6 = LineItems6
  { accountId :: Maybe Text
  , additionalFields :: AdditionalFields14
  , classId :: Maybe Text
  , description :: Maybe Text
  , item :: Maybe Item4
  , taxRateId :: Maybe Text
  , totalAmount :: Double
  }
  deriving (Show, Eq)

instance FromJSON LineItems6 where
  parseJSON = withObject "LineItems6" $ \obj -> do
    accountId <- obj .: "account_id"
    additionalFields <- obj .: "additional_fields"
    classId <- obj .: "class_id"
    description <- obj .: "description"
    item <- obj .: "item"
    taxRateId <- obj .: "tax_rate_id"
    totalAmount <- obj .: "total_amount"
    pure $ LineItems6{..}

instance ToJSON LineItems6 where
  toJSON LineItems6{..} =
    object [
      "account_id" .= accountId,
      "additional_fields" .= additionalFields,
      "class_id" .= classId,
      "description" .= description,
      "item" .= item,
      "tax_rate_id" .= taxRateId,
      "total_amount" .= totalAmount
    ]
