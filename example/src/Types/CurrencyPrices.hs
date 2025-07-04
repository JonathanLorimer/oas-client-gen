{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CurrencyPrices where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data CurrencyPrices = CurrencyPrices
  { isoCurrencyCode :: Text
  , price :: Double
  }
  deriving (Show, Eq)

instance FromJSON CurrencyPrices where
  parseJSON = withObject "CurrencyPrices" $ \obj -> do
    isoCurrencyCode <- obj .: "iso_currency_code"
    price <- obj .: "price"
    pure $ CurrencyPrices{..}

instance ToJSON CurrencyPrices where
  toJSON CurrencyPrices{..} =
    object [
      "iso_currency_code" .= isoCurrencyCode,
      "price" .= price
    ]
