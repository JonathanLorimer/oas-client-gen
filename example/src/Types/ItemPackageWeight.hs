{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ItemPackageWeight where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data ItemPackageWeight = ItemPackageWeight
  { unit :: Text
  , value :: Double
  }
  deriving (Show, Eq)

instance FromJSON ItemPackageWeight where
  parseJSON = withObject "ItemPackageWeight" $ \obj -> do
    unit <- obj .: "unit"
    value <- obj .: "value"
    pure $ ItemPackageWeight{..}

instance ToJSON ItemPackageWeight where
  toJSON ItemPackageWeight{..} =
    object [
      "unit" .= unit,
      "value" .= value
    ]
