{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Type8 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Type8 = Type8
  { value :: Text
  }
  deriving (Show, Eq)

instance FromJSON Type8 where
  parseJSON = withObject "Type8" $ \obj -> do
    value <- obj .: "value"
    pure $ Type8{..}

instance ToJSON Type8 where
  toJSON Type8{..} =
    object [
      "value" .= value
    ]
