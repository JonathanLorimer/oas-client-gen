{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ItemPackageWeight4 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data ItemPackageWeight4 = ItemPackageWeight4
  { unit :: Text
  , value :: Double
  }
  deriving (Show, Eq)

instance FromJSON ItemPackageWeight4 where
  parseJSON = withObject "ItemPackageWeight4" $ \obj -> do
    unit <- obj .: "unit"
    value <- obj .: "value"
    pure $ ItemPackageWeight4{..}

instance ToJSON ItemPackageWeight4 where
  toJSON ItemPackageWeight4{..} =
    object [
      "unit" .= unit,
      "value" .= value
    ]
