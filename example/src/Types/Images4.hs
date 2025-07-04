{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Images4 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Images4 = Images4
  { src :: Text
  }
  deriving (Show, Eq)

instance FromJSON Images4 where
  parseJSON = withObject "Images4" $ \obj -> do
    src <- obj .: "src"
    pure $ Images4{..}

instance ToJSON Images4 where
  toJSON Images4{..} =
    object [
      "src" .= src
    ]
