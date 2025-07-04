{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Shipping4 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.Height5 (Height5)
import Types.ItemPackageDimensions4 (ItemPackageDimensions4)
import Types.ItemPackageWeight4 (ItemPackageWeight4)
import Types.Length4 (Length4)
import Types.Width5 (Width5)

data Shipping4 = Shipping4
  { itemPackageDimensions :: ItemPackageDimensions4
  , itemPackageWeight :: ItemPackageWeight4
  }
  deriving (Show, Eq)

instance FromJSON Shipping4 where
  parseJSON = withObject "Shipping4" $ \obj -> do
    itemPackageDimensions <- obj .: "item_package_dimensions"
    itemPackageWeight <- obj .: "item_package_weight"
    pure $ Shipping4{..}

instance ToJSON Shipping4 where
  toJSON Shipping4{..} =
    object [
      "item_package_dimensions" .= itemPackageDimensions,
      "item_package_weight" .= itemPackageWeight
    ]
