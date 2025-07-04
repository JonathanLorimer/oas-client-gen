{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.VariationTheme6 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data VariationTheme6 = VariationTheme6
  { name :: Text
  }
  deriving (Show, Eq)

instance FromJSON VariationTheme6 where
  parseJSON = withObject "VariationTheme6" $ \obj -> do
    name <- obj .: "name"
    pure $ VariationTheme6{..}

instance ToJSON VariationTheme6 where
  toJSON VariationTheme6{..} =
    object [
      "name" .= name
    ]
