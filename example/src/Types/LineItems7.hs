{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.LineItems7 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AdditionalFields16 (AdditionalFields16)
import Types.Item5 (Item5)

data LineItems7 = LineItems7
  { accountId :: Text
  , additionalFields :: AdditionalFields16
  , classId :: Text
  , description :: Text
  , item :: Item5
  , taxRateId :: Text
  , totalAmount :: Double
  }
  deriving (Show, Eq)

instance FromJSON LineItems7 where
  parseJSON = withObject "LineItems7" $ \obj -> do
    accountId <- obj .: "account_id"
    additionalFields <- obj .: "additional_fields"
    classId <- obj .: "class_id"
    description <- obj .: "description"
    item <- obj .: "item"
    taxRateId <- obj .: "tax_rate_id"
    totalAmount <- obj .: "total_amount"
    pure $ LineItems7{..}

instance ToJSON LineItems7 where
  toJSON LineItems7{..} =
    object [
      "account_id" .= accountId,
      "additional_fields" .= additionalFields,
      "class_id" .= classId,
      "description" .= description,
      "item" .= item,
      "tax_rate_id" .= taxRateId,
      "total_amount" .= totalAmount
    ]
