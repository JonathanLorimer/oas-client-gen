{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Type6 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Type6 = Type6
  { value :: Text
  }
  deriving (Show, Eq)

instance FromJSON Type6 where
  parseJSON = withObject "Type6" $ \obj -> do
    value <- obj .: "value"
    pure $ Type6{..}

instance ToJSON Type6 where
  toJSON Type6{..} =
    object [
      "value" .= value
    ]
