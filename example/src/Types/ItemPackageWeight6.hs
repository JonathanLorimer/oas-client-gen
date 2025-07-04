{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ItemPackageWeight6 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data ItemPackageWeight6 = ItemPackageWeight6
  { unit :: Text
  , value :: Double
  }
  deriving (Show, Eq)

instance FromJSON ItemPackageWeight6 where
  parseJSON = withObject "ItemPackageWeight6" $ \obj -> do
    unit <- obj .: "unit"
    value <- obj .: "value"
    pure $ ItemPackageWeight6{..}

instance ToJSON ItemPackageWeight6 where
  toJSON ItemPackageWeight6{..} =
    object [
      "unit" .= unit,
      "value" .= value
    ]
