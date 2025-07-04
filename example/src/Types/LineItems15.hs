{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.LineItems15 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AdditionalFields34 (AdditionalFields34)

data LineItems15 = LineItems15
  { accountId :: Text
  , additionalFields :: AdditionalFields34
  , description :: Text
  , taxRateId :: Text
  , totalAmount :: Double
  }
  deriving (Show, Eq)

instance FromJSON LineItems15 where
  parseJSON = withObject "LineItems15" $ \obj -> do
    accountId <- obj .: "account_id"
    additionalFields <- obj .: "additional_fields"
    description <- obj .: "description"
    taxRateId <- obj .: "tax_rate_id"
    totalAmount <- obj .: "total_amount"
    pure $ LineItems15{..}

instance ToJSON LineItems15 where
  toJSON LineItems15{..} =
    object [
      "account_id" .= accountId,
      "additional_fields" .= additionalFields,
      "description" .= description,
      "tax_rate_id" .= taxRateId,
      "total_amount" .= totalAmount
    ]
