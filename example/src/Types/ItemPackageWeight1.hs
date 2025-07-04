{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ItemPackageWeight1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data ItemPackageWeight1 = ItemPackageWeight1
  { unit :: Text
  , value :: Double
  }
  deriving (Show, Eq)

instance FromJSON ItemPackageWeight1 where
  parseJSON = withObject "ItemPackageWeight1" $ \obj -> do
    unit <- obj .: "unit"
    value <- obj .: "value"
    pure $ ItemPackageWeight1{..}

instance ToJSON ItemPackageWeight1 where
  toJSON ItemPackageWeight1{..} =
    object [
      "unit" .= unit,
      "value" .= value
    ]
