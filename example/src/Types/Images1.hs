{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Images1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Images1 = Images1
  { src :: Text
  }
  deriving (Show, Eq)

instance FromJSON Images1 where
  parseJSON = withObject "Images1" $ \obj -> do
    src <- obj .: "src"
    pure $ Images1{..}

instance ToJSON Images1 where
  toJSON Images1{..} =
    object [
      "src" .= src
    ]
