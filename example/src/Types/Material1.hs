{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Material1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Material1 = Material1
  { value :: Text
  }
  deriving (Show, Eq)

instance FromJSON Material1 where
  parseJSON = withObject "Material1" $ \obj -> do
    value <- obj .: "value"
    pure $ Material1{..}

instance ToJSON Material1 where
  toJSON Material1{..} =
    object [
      "value" .= value
    ]
