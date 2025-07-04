{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Variants2 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.Images3 (Images3)
import Types.Inventory1 (Inventory1)
import Types.OptionValues1 (OptionValues1)
import Types.Weight1 (Weight1)

data Variants2 = Variants2
  { id :: Text
  , images :: [Images3]
  , inventory :: Inventory1
  , optionValues :: [OptionValues1]
  , price :: Double
  , sku :: Text
  , weight :: Weight1
  }
  deriving (Show, Eq)

instance FromJSON Variants2 where
  parseJSON = withObject "Variants2" $ \obj -> do
    id <- obj .: "id"
    images <- obj .: "images"
    inventory <- obj .: "inventory"
    optionValues <- obj .: "option_values"
    price <- obj .: "price"
    sku <- obj .: "sku"
    weight <- obj .: "weight"
    pure $ Variants2{..}

instance ToJSON Variants2 where
  toJSON Variants2{..} =
    object [
      "id" .= id,
      "images" .= images,
      "inventory" .= inventory,
      "option_values" .= optionValues,
      "price" .= price,
      "sku" .= sku,
      "weight" .= weight
    ]
