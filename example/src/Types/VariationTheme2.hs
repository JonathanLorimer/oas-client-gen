{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.VariationTheme2 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data VariationTheme2 = VariationTheme2
  { name :: Text
  }
  deriving (Show, Eq)

instance FromJSON VariationTheme2 where
  parseJSON = withObject "VariationTheme2" $ \obj -> do
    name <- obj .: "name"
    pure $ VariationTheme2{..}

instance ToJSON VariationTheme2 where
  toJSON VariationTheme2{..} =
    object [
      "name" .= name
    ]
