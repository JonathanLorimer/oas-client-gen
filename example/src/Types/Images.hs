{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Images where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Images = Images
  { src :: Text
  }
  deriving (Show, Eq)

instance FromJSON Images where
  parseJSON = withObject "Images" $ \obj -> do
    src <- obj .: "src"
    pure $ Images{..}

instance ToJSON Images where
  toJSON Images{..} =
    object [
      "src" .= src
    ]
