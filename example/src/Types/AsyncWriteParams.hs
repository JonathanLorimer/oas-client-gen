{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AsyncWriteParams where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data AsyncWriteParams = AsyncWriteParams
  { responseMode :: Text
  }
  deriving (Show, Eq)

instance FromJSON AsyncWriteParams where
  parseJSON = withObject "AsyncWriteParams" $ \obj -> do
    responseMode <- obj .: "response_mode"
    pure $ AsyncWriteParams{..}

instance ToJSON AsyncWriteParams where
  toJSON AsyncWriteParams{..} =
    object [
      "response_mode" .= responseMode
    ]
