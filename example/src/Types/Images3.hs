{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Images3 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Images3 = Images3
  { src :: Text
  }
  deriving (Show, Eq)

instance FromJSON Images3 where
  parseJSON = withObject "Images3" $ \obj -> do
    src <- obj .: "src"
    pure $ Images3{..}

instance ToJSON Images3 where
  toJSON Images3{..} =
    object [
      "src" .= src
    ]
