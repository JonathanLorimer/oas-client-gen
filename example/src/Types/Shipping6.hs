{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Shipping6 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.Height10 (Height10)
import Types.ItemPackageDimensions6 (ItemPackageDimensions6)
import Types.ItemPackageWeight6 (ItemPackageWeight6)
import Types.Length9 (Length9)
import Types.Width11 (Width11)

data Shipping6 = Shipping6
  { itemPackageDimensions :: ItemPackageDimensions6
  , itemPackageWeight :: ItemPackageWeight6
  }
  deriving (Show, Eq)

instance FromJSON Shipping6 where
  parseJSON = withObject "Shipping6" $ \obj -> do
    itemPackageDimensions <- obj .: "item_package_dimensions"
    itemPackageWeight <- obj .: "item_package_weight"
    pure $ Shipping6{..}

instance ToJSON Shipping6 where
  toJSON Shipping6{..} =
    object [
      "item_package_dimensions" .= itemPackageDimensions,
      "item_package_weight" .= itemPackageWeight
    ]
