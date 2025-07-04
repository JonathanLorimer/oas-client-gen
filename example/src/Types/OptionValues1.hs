{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OptionValues1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OptionValues1 = OptionValues1
  { name :: Text
  , value :: Text
  }
  deriving (Show, Eq)

instance FromJSON OptionValues1 where
  parseJSON = withObject "OptionValues1" $ \obj -> do
    name <- obj .: "name"
    value <- obj .: "value"
    pure $ OptionValues1{..}

instance ToJSON OptionValues1 where
  toJSON OptionValues1{..} =
    object [
      "name" .= name,
      "value" .= value
    ]
