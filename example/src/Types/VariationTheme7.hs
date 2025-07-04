{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.VariationTheme7 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data VariationTheme7 = VariationTheme7
  { name :: Text
  }
  deriving (Show, Eq)

instance FromJSON VariationTheme7 where
  parseJSON = withObject "VariationTheme7" $ \obj -> do
    name <- obj .: "name"
    pure $ VariationTheme7{..}

instance ToJSON VariationTheme7 where
  toJSON VariationTheme7{..} =
    object [
      "name" .= name
    ]
