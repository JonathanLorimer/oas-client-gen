{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Type where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Type = Type
  { value :: Text
  }
  deriving (Show, Eq)

instance FromJSON Type where
  parseJSON = withObject "Type" $ \obj -> do
    value <- obj .: "value"
    pure $ Type{..}

instance ToJSON Type where
  toJSON Type{..} =
    object [
      "value" .= value
    ]
