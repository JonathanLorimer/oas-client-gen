{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Components1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AdditionalFields39 (AdditionalFields39)

data Components1 = Components1
  { additionalFields :: AdditionalFields39
  , isCompound :: Bool
  , isPurchasesTax :: Bool
  , isSalesTax :: Bool
  , name :: Text
  , rate :: Double
  }
  deriving (Show, Eq)

instance FromJSON Components1 where
  parseJSON = withObject "Components1" $ \obj -> do
    additionalFields <- obj .: "additional_fields"
    isCompound <- obj .: "is_compound"
    isPurchasesTax <- obj .: "is_purchases_tax"
    isSalesTax <- obj .: "is_sales_tax"
    name <- obj .: "name"
    rate <- obj .: "rate"
    pure $ Components1{..}

instance ToJSON Components1 where
  toJSON Components1{..} =
    object [
      "additional_fields" .= additionalFields,
      "is_compound" .= isCompound,
      "is_purchases_tax" .= isPurchasesTax,
      "is_sales_tax" .= isSalesTax,
      "name" .= name,
      "rate" .= rate
    ]
