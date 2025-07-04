{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Type1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Type1 = Type1
  { value :: Text
  }
  deriving (Show, Eq)

instance FromJSON Type1 where
  parseJSON = withObject "Type1" $ \obj -> do
    value <- obj .: "value"
    pure $ Type1{..}

instance ToJSON Type1 where
  toJSON Type1{..} =
    object [
      "value" .= value
    ]
