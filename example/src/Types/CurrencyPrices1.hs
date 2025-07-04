{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CurrencyPrices1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data CurrencyPrices1 = CurrencyPrices1
  { isoCurrencyCode :: Text
  , price :: Double
  }
  deriving (Show, Eq)

instance FromJSON CurrencyPrices1 where
  parseJSON = withObject "CurrencyPrices1" $ \obj -> do
    isoCurrencyCode <- obj .: "iso_currency_code"
    price <- obj .: "price"
    pure $ CurrencyPrices1{..}

instance ToJSON CurrencyPrices1 where
  toJSON CurrencyPrices1{..} =
    object [
      "iso_currency_code" .= isoCurrencyCode,
      "price" .= price
    ]
