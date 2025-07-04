{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.VariationTheme8 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data VariationTheme8 = VariationTheme8
  { name :: Text
  }
  deriving (Show, Eq)

instance FromJSON VariationTheme8 where
  parseJSON = withObject "VariationTheme8" $ \obj -> do
    name <- obj .: "name"
    pure $ VariationTheme8{..}

instance ToJSON VariationTheme8 where
  toJSON VariationTheme8{..} =
    object [
      "name" .= name
    ]
