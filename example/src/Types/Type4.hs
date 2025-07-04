{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Type4 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Type4 = Type4
  { value :: Text
  }
  deriving (Show, Eq)

instance FromJSON Type4 where
  parseJSON = withObject "Type4" $ \obj -> do
    value <- obj .: "value"
    pure $ Type4{..}

instance ToJSON Type4 where
  toJSON Type4{..} =
    object [
      "value" .= value
    ]
