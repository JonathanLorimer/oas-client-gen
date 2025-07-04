{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.VariationTheme1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data VariationTheme1 = VariationTheme1
  { name :: Text
  }
  deriving (Show, Eq)

instance FromJSON VariationTheme1 where
  parseJSON = withObject "VariationTheme1" $ \obj -> do
    name <- obj .: "name"
    pure $ VariationTheme1{..}

instance ToJSON VariationTheme1 where
  toJSON VariationTheme1{..} =
    object [
      "name" .= name
    ]
