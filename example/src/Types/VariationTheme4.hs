{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.VariationTheme4 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data VariationTheme4 = VariationTheme4
  { name :: Text
  }
  deriving (Show, Eq)

instance FromJSON VariationTheme4 where
  parseJSON = withObject "VariationTheme4" $ \obj -> do
    name <- obj .: "name"
    pure $ VariationTheme4{..}

instance ToJSON VariationTheme4 where
  toJSON VariationTheme4{..} =
    object [
      "name" .= name
    ]
