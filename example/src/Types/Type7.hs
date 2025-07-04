{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Type7 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Type7 = Type7
  { value :: Text
  }
  deriving (Show, Eq)

instance FromJSON Type7 where
  parseJSON = withObject "Type7" $ \obj -> do
    value <- obj .: "value"
    pure $ Type7{..}

instance ToJSON Type7 where
  toJSON Type7{..} =
    object [
      "value" .= value
    ]
