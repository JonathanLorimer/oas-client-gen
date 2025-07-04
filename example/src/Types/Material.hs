{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Material where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Material = Material
  { value :: Text
  }
  deriving (Show, Eq)

instance FromJSON Material where
  parseJSON = withObject "Material" $ \obj -> do
    value <- obj .: "value"
    pure $ Material{..}

instance ToJSON Material where
  toJSON Material{..} =
    object [
      "value" .= value
    ]
