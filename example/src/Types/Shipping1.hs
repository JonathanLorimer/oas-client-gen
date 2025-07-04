{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Shipping1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.Height1 (Height1)
import Types.ItemPackageDimensions1 (ItemPackageDimensions1)
import Types.ItemPackageWeight1 (ItemPackageWeight1)
import Types.Length1 (Length1)
import Types.Width1 (Width1)

data Shipping1 = Shipping1
  { itemPackageDimensions :: ItemPackageDimensions1
  , itemPackageWeight :: ItemPackageWeight1
  }
  deriving (Show, Eq)

instance FromJSON Shipping1 where
  parseJSON = withObject "Shipping1" $ \obj -> do
    itemPackageDimensions <- obj .: "item_package_dimensions"
    itemPackageWeight <- obj .: "item_package_weight"
    pure $ Shipping1{..}

instance ToJSON Shipping1 where
  toJSON Shipping1{..} =
    object [
      "item_package_dimensions" .= itemPackageDimensions,
      "item_package_weight" .= itemPackageWeight
    ]
