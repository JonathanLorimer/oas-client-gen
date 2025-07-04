{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Variant where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.Images4 (Images4)
import Types.Inventory2 (Inventory2)
import Types.OptionValues2 (OptionValues2)
import Types.Weight2 (Weight2)

data Variant = Variant
  { id :: Text
  , images :: [Images4]
  , inventory :: Inventory2
  , optionValues :: [OptionValues2]
  , price :: Double
  , sku :: Text
  , weight :: Weight2
  }
  deriving (Show, Eq)

instance FromJSON Variant where
  parseJSON = withObject "Variant" $ \obj -> do
    id <- obj .: "id"
    images <- obj .: "images"
    inventory <- obj .: "inventory"
    optionValues <- obj .: "option_values"
    price <- obj .: "price"
    sku <- obj .: "sku"
    weight <- obj .: "weight"
    pure $ Variant{..}

instance ToJSON Variant where
  toJSON Variant{..} =
    object [
      "id" .= id,
      "images" .= images,
      "inventory" .= inventory,
      "option_values" .= optionValues,
      "price" .= price,
      "sku" .= sku,
      "weight" .= weight
    ]
