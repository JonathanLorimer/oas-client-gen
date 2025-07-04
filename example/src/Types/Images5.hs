{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Images5 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Images5 = Images5
  { src :: Text
  }
  deriving (Show, Eq)

instance FromJSON Images5 where
  parseJSON = withObject "Images5" $ \obj -> do
    src <- obj .: "src"
    pure $ Images5{..}

instance ToJSON Images5 where
  toJSON Images5{..} =
    object [
      "src" .= src
    ]
