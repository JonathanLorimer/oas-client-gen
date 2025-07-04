{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AsyncResponse40 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data AsyncResponse40 = AsyncResponse40
  { id :: Text
  , responseUrl :: Text
  , status :: Text
  }
  deriving (Show, Eq)

instance FromJSON AsyncResponse40 where
  parseJSON = withObject "AsyncResponse40" $ \obj -> do
    id <- obj .: "id"
    responseUrl <- obj .: "response_url"
    status <- obj .: "status"
    pure $ AsyncResponse40{..}

instance ToJSON AsyncResponse40 where
  toJSON AsyncResponse40{..} =
    object [
      "id" .= id,
      "response_url" .= responseUrl,
      "status" .= status
    ]
