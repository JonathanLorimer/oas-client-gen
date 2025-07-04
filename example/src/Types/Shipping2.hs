{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Shipping2 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.Height2 (Height2)
import Types.ItemPackageDimensions2 (ItemPackageDimensions2)
import Types.ItemPackageWeight2 (ItemPackageWeight2)
import Types.Length2 (Length2)
import Types.Width2 (Width2)

data Shipping2 = Shipping2
  { itemPackageDimensions :: ItemPackageDimensions2
  , itemPackageWeight :: ItemPackageWeight2
  }
  deriving (Show, Eq)

instance FromJSON Shipping2 where
  parseJSON = withObject "Shipping2" $ \obj -> do
    itemPackageDimensions <- obj .: "item_package_dimensions"
    itemPackageWeight <- obj .: "item_package_weight"
    pure $ Shipping2{..}

instance ToJSON Shipping2 where
  toJSON Shipping2{..} =
    object [
      "item_package_dimensions" .= itemPackageDimensions,
      "item_package_weight" .= itemPackageWeight
    ]
