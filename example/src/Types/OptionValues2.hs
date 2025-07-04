{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OptionValues2 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OptionValues2 = OptionValues2
  { name :: Text
  , value :: Text
  }
  deriving (Show, Eq)

instance FromJSON OptionValues2 where
  parseJSON = withObject "OptionValues2" $ \obj -> do
    name <- obj .: "name"
    value <- obj .: "value"
    pure $ OptionValues2{..}

instance ToJSON OptionValues2 where
  toJSON OptionValues2{..} =
    object [
      "name" .= name,
      "value" .= value
    ]
