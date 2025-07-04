{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Shipping7 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.Height11 (Height11)
import Types.ItemPackageDimensions7 (ItemPackageDimensions7)
import Types.ItemPackageWeight7 (ItemPackageWeight7)
import Types.Length11 (Length11)
import Types.Width13 (Width13)

data Shipping7 = Shipping7
  { itemPackageDimensions :: ItemPackageDimensions7
  , itemPackageWeight :: ItemPackageWeight7
  }
  deriving (Show, Eq)

instance FromJSON Shipping7 where
  parseJSON = withObject "Shipping7" $ \obj -> do
    itemPackageDimensions <- obj .: "item_package_dimensions"
    itemPackageWeight <- obj .: "item_package_weight"
    pure $ Shipping7{..}

instance ToJSON Shipping7 where
  toJSON Shipping7{..} =
    object [
      "item_package_dimensions" .= itemPackageDimensions,
      "item_package_weight" .= itemPackageWeight
    ]
