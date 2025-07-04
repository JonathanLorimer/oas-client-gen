{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AsyncResponse14 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data AsyncResponse14 = AsyncResponse14
  { id :: Text
  , responseUrl :: Text
  , status :: Text
  }
  deriving (Show, Eq)

instance FromJSON AsyncResponse14 where
  parseJSON = withObject "AsyncResponse14" $ \obj -> do
    id <- obj .: "id"
    responseUrl <- obj .: "response_url"
    status <- obj .: "status"
    pure $ AsyncResponse14{..}

instance ToJSON AsyncResponse14 where
  toJSON AsyncResponse14{..} =
    object [
      "id" .= id,
      "response_url" .= responseUrl,
      "status" .= status
    ]
