{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Images2 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Images2 = Images2
  { src :: Text
  }
  deriving (Show, Eq)

instance FromJSON Images2 where
  parseJSON = withObject "Images2" $ \obj -> do
    src <- obj .: "src"
    pure $ Images2{..}

instance ToJSON Images2 where
  toJSON Images2{..} =
    object [
      "src" .= src
    ]
