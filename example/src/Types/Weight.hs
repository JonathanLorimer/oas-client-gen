{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Weight where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Weight = Weight
  { unit :: Text
  , value :: Double
  }
  deriving (Show, Eq)

instance FromJSON Weight where
  parseJSON = withObject "Weight" $ \obj -> do
    unit <- obj .: "unit"
    value <- obj .: "value"
    pure $ Weight{..}

instance ToJSON Weight where
  toJSON Weight{..} =
    object [
      "unit" .= unit,
      "value" .= value
    ]
