{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Shipping5 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.Height8 (Height8)
import Types.ItemPackageDimensions5 (ItemPackageDimensions5)
import Types.ItemPackageWeight5 (ItemPackageWeight5)
import Types.Length7 (Length7)
import Types.Width9 (Width9)

data Shipping5 = Shipping5
  { itemPackageDimensions :: ItemPackageDimensions5
  , itemPackageWeight :: ItemPackageWeight5
  }
  deriving (Show, Eq)

instance FromJSON Shipping5 where
  parseJSON = withObject "Shipping5" $ \obj -> do
    itemPackageDimensions <- obj .: "item_package_dimensions"
    itemPackageWeight <- obj .: "item_package_weight"
    pure $ Shipping5{..}

instance ToJSON Shipping5 where
  toJSON Shipping5{..} =
    object [
      "item_package_dimensions" .= itemPackageDimensions,
      "item_package_weight" .= itemPackageWeight
    ]
