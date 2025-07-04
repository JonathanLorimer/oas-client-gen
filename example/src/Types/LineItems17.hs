{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.LineItems17 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data LineItems17 = LineItems17
  { description :: Text
  , item :: Text
  , quantity :: Double
  , taxRateId :: Text
  , unitAmount :: Double
  }
  deriving (Show, Eq)

instance FromJSON LineItems17 where
  parseJSON = withObject "LineItems17" $ \obj -> do
    description <- obj .: "description"
    item <- obj .: "item"
    quantity <- obj .: "quantity"
    taxRateId <- obj .: "tax_rate_id"
    unitAmount <- obj .: "unit_amount"
    pure $ LineItems17{..}

instance ToJSON LineItems17 where
  toJSON LineItems17{..} =
    object [
      "description" .= description,
      "item" .= item,
      "quantity" .= quantity,
      "tax_rate_id" .= taxRateId,
      "unit_amount" .= unitAmount
    ]
