{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ItemPackageWeight2 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data ItemPackageWeight2 = ItemPackageWeight2
  { unit :: Text
  , value :: Double
  }
  deriving (Show, Eq)

instance FromJSON ItemPackageWeight2 where
  parseJSON = withObject "ItemPackageWeight2" $ \obj -> do
    unit <- obj .: "unit"
    value <- obj .: "value"
    pure $ ItemPackageWeight2{..}

instance ToJSON ItemPackageWeight2 where
  toJSON ItemPackageWeight2{..} =
    object [
      "unit" .= unit,
      "value" .= value
    ]
