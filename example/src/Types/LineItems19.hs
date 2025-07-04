{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.LineItems19 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.Item11 (Item11)

data LineItems19 = LineItems19
  { description :: Maybe Text
  , item :: Maybe Item11
  , platformId :: Maybe Text
  , taxRateId :: Maybe Text
  , totalAmount :: Maybe Double
  }
  deriving (Show, Eq)

instance FromJSON LineItems19 where
  parseJSON = withObject "LineItems19" $ \obj -> do
    description <- obj .: "description"
    item <- obj .: "item"
    platformId <- obj .: "platform_id"
    taxRateId <- obj .: "tax_rate_id"
    totalAmount <- obj .: "total_amount"
    pure $ LineItems19{..}

instance ToJSON LineItems19 where
  toJSON LineItems19{..} =
    object [
      "description" .= description,
      "item" .= item,
      "platform_id" .= platformId,
      "tax_rate_id" .= taxRateId,
      "total_amount" .= totalAmount
    ]
