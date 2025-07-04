{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.VariationTheme where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data VariationTheme = VariationTheme
  { name :: Text
  }
  deriving (Show, Eq)

instance FromJSON VariationTheme where
  parseJSON = withObject "VariationTheme" $ \obj -> do
    name <- obj .: "name"
    pure $ VariationTheme{..}

instance ToJSON VariationTheme where
  toJSON VariationTheme{..} =
    object [
      "name" .= name
    ]
