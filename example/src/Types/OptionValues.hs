{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OptionValues where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OptionValues = OptionValues
  { name :: Text
  , value :: Text
  }
  deriving (Show, Eq)

instance FromJSON OptionValues where
  parseJSON = withObject "OptionValues" $ \obj -> do
    name <- obj .: "name"
    value <- obj .: "value"
    pure $ OptionValues{..}

instance ToJSON OptionValues where
  toJSON OptionValues{..} =
    object [
      "name" .= name,
      "value" .= value
    ]
