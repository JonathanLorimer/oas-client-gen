{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AsyncResponse25 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data AsyncResponse25 = AsyncResponse25
  { id :: Text
  , responseUrl :: Text
  , status :: Text
  }
  deriving (Show, Eq)

instance FromJSON AsyncResponse25 where
  parseJSON = withObject "AsyncResponse25" $ \obj -> do
    id <- obj .: "id"
    responseUrl <- obj .: "response_url"
    status <- obj .: "status"
    pure $ AsyncResponse25{..}

instance ToJSON AsyncResponse25 where
  toJSON AsyncResponse25{..} =
    object [
      "id" .= id,
      "response_url" .= responseUrl,
      "status" .= status
    ]
