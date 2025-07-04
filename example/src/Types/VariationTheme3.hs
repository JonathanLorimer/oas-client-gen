{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.VariationTheme3 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data VariationTheme3 = VariationTheme3
  { name :: Text
  }
  deriving (Show, Eq)

instance FromJSON VariationTheme3 where
  parseJSON = withObject "VariationTheme3" $ \obj -> do
    name <- obj .: "name"
    pure $ VariationTheme3{..}

instance ToJSON VariationTheme3 where
  toJSON VariationTheme3{..} =
    object [
      "name" .= name
    ]
