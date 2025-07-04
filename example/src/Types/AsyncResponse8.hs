{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AsyncResponse8 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data AsyncResponse8 = AsyncResponse8
  { id :: Text
  , responseUrl :: Text
  , status :: Text
  }
  deriving (Show, Eq)

instance FromJSON AsyncResponse8 where
  parseJSON = withObject "AsyncResponse8" $ \obj -> do
    id <- obj .: "id"
    responseUrl <- obj .: "response_url"
    status <- obj .: "status"
    pure $ AsyncResponse8{..}

instance ToJSON AsyncResponse8 where
  toJSON AsyncResponse8{..} =
    object [
      "id" .= id,
      "response_url" .= responseUrl,
      "status" .= status
    ]
