{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Type5 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Type5 = Type5
  { value :: Text
  }
  deriving (Show, Eq)

instance FromJSON Type5 where
  parseJSON = withObject "Type5" $ \obj -> do
    value <- obj .: "value"
    pure $ Type5{..}

instance ToJSON Type5 where
  toJSON Type5{..} =
    object [
      "value" .= value
    ]
