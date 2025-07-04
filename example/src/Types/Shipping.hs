{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Shipping where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.Height (Height)
import Types.ItemPackageDimensions (ItemPackageDimensions)
import Types.ItemPackageWeight (ItemPackageWeight)
import Types.Length (Length)
import Types.Width (Width)

data Shipping = Shipping
  { itemPackageDimensions :: ItemPackageDimensions
  , itemPackageWeight :: ItemPackageWeight
  , numberOfBoxes :: Int
  }
  deriving (Show, Eq)

instance FromJSON Shipping where
  parseJSON = withObject "Shipping" $ \obj -> do
    itemPackageDimensions <- obj .: "item_package_dimensions"
    itemPackageWeight <- obj .: "item_package_weight"
    numberOfBoxes <- obj .: "number_of_boxes"
    pure $ Shipping{..}

instance ToJSON Shipping where
  toJSON Shipping{..} =
    object [
      "item_package_dimensions" .= itemPackageDimensions,
      "item_package_weight" .= itemPackageWeight,
      "number_of_boxes" .= numberOfBoxes
    ]
