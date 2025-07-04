{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.VariationTheme5 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data VariationTheme5 = VariationTheme5
  { name :: Text
  }
  deriving (Show, Eq)

instance FromJSON VariationTheme5 where
  parseJSON = withObject "VariationTheme5" $ \obj -> do
    name <- obj .: "name"
    pure $ VariationTheme5{..}

instance ToJSON VariationTheme5 where
  toJSON VariationTheme5{..} =
    object [
      "name" .= name
    ]
