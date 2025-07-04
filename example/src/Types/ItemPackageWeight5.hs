{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ItemPackageWeight5 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data ItemPackageWeight5 = ItemPackageWeight5
  { unit :: Text
  , value :: Double
  }
  deriving (Show, Eq)

instance FromJSON ItemPackageWeight5 where
  parseJSON = withObject "ItemPackageWeight5" $ \obj -> do
    unit <- obj .: "unit"
    value <- obj .: "value"
    pure $ ItemPackageWeight5{..}

instance ToJSON ItemPackageWeight5 where
  toJSON ItemPackageWeight5{..} =
    object [
      "unit" .= unit,
      "value" .= value
    ]
