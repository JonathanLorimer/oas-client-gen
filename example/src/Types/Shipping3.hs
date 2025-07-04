{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Shipping3 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.Height4 (Height4)
import Types.ItemPackageDimensions3 (ItemPackageDimensions3)
import Types.ItemPackageWeight3 (ItemPackageWeight3)
import Types.Length3 (Length3)
import Types.Width4 (Width4)

data Shipping3 = Shipping3
  { itemPackageDimensions :: ItemPackageDimensions3
  , itemPackageWeight :: ItemPackageWeight3
  , numberOfBoxes :: Int
  }
  deriving (Show, Eq)

instance FromJSON Shipping3 where
  parseJSON = withObject "Shipping3" $ \obj -> do
    itemPackageDimensions <- obj .: "item_package_dimensions"
    itemPackageWeight <- obj .: "item_package_weight"
    numberOfBoxes <- obj .: "number_of_boxes"
    pure $ Shipping3{..}

instance ToJSON Shipping3 where
  toJSON Shipping3{..} =
    object [
      "item_package_dimensions" .= itemPackageDimensions,
      "item_package_weight" .= itemPackageWeight,
      "number_of_boxes" .= numberOfBoxes
    ]
