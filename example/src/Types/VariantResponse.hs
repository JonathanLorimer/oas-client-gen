{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.VariantResponse where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.CurrencyPrices1 (CurrencyPrices1)
import Types.Images5 (Images5)
import Types.Inventory3 (Inventory3)
import Types.LinkedProducts1 (LinkedProducts1)
import Types.Locations1 (Locations1)
import Types.OptionValues3 (OptionValues3)
import Types.Variant1 (Variant1)
import Types.Weight3 (Weight3)

data VariantResponse = VariantResponse
  { variant :: Variant1
  }
  deriving (Show, Eq)

instance FromJSON VariantResponse where
  parseJSON = withObject "VariantResponse" $ \obj -> do
    variant <- obj .: "variant"
    pure $ VariantResponse{..}

instance ToJSON VariantResponse where
  toJSON VariantResponse{..} =
    object [
      "variant" .= variant
    ]
