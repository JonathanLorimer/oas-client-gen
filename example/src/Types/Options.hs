{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Options where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Options = Options
  { text :: Text
  , value :: Text
  }
  deriving (Show, Eq)

instance FromJSON Options where
  parseJSON = withObject "Options" $ \obj -> do
    text <- obj .: "text"
    value <- obj .: "value"
    pure $ Options{..}

instance ToJSON Options where
  toJSON Options{..} =
    object [
      "text" .= text,
      "value" .= value
    ]
