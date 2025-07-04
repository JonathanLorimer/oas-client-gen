{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.LineItems14 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AdditionalFields32 (AdditionalFields32)

data LineItems14 = LineItems14
  { accountId :: Maybe Text
  , additionalFields :: AdditionalFields32
  , description :: Maybe Text
  , taxRateId :: Maybe Text
  , totalAmount :: Double
  }
  deriving (Show, Eq)

instance FromJSON LineItems14 where
  parseJSON = withObject "LineItems14" $ \obj -> do
    accountId <- obj .: "account_id"
    additionalFields <- obj .: "additional_fields"
    description <- obj .: "description"
    taxRateId <- obj .: "tax_rate_id"
    totalAmount <- obj .: "total_amount"
    pure $ LineItems14{..}

instance ToJSON LineItems14 where
  toJSON LineItems14{..} =
    object [
      "account_id" .= accountId,
      "additional_fields" .= additionalFields,
      "description" .= description,
      "tax_rate_id" .= taxRateId,
      "total_amount" .= totalAmount
    ]
