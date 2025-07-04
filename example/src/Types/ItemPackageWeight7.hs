{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ItemPackageWeight7 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data ItemPackageWeight7 = ItemPackageWeight7
  { unit :: Text
  , value :: Double
  }
  deriving (Show, Eq)

instance FromJSON ItemPackageWeight7 where
  parseJSON = withObject "ItemPackageWeight7" $ \obj -> do
    unit <- obj .: "unit"
    value <- obj .: "value"
    pure $ ItemPackageWeight7{..}

instance ToJSON ItemPackageWeight7 where
  toJSON ItemPackageWeight7{..} =
    object [
      "unit" .= unit,
      "value" .= value
    ]
