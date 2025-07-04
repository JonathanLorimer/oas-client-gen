{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Width13 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Width13 = Width13
  { unit :: Text
  , value :: Double
  }
  deriving (Show, Eq)

instance FromJSON Width13 where
  parseJSON = withObject "Width13" $ \obj -> do
    unit <- obj .: "unit"
    value <- obj .: "value"
    pure $ Width13{..}

instance ToJSON Width13 where
  toJSON Width13{..} =
    object [
      "unit" .= unit,
      "value" .= value
    ]
