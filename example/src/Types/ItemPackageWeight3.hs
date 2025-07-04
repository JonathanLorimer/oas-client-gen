{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ItemPackageWeight3 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data ItemPackageWeight3 = ItemPackageWeight3
  { unit :: Text
  , value :: Double
  }
  deriving (Show, Eq)

instance FromJSON ItemPackageWeight3 where
  parseJSON = withObject "ItemPackageWeight3" $ \obj -> do
    unit <- obj .: "unit"
    value <- obj .: "value"
    pure $ ItemPackageWeight3{..}

instance ToJSON ItemPackageWeight3 where
  toJSON ItemPackageWeight3{..} =
    object [
      "unit" .= unit,
      "value" .= value
    ]
