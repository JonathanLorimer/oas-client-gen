{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AsyncResponse9 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data AsyncResponse9 = AsyncResponse9
  { id :: Text
  , responseUrl :: Text
  , status :: Text
  }
  deriving (Show, Eq)

instance FromJSON AsyncResponse9 where
  parseJSON = withObject "AsyncResponse9" $ \obj -> do
    id <- obj .: "id"
    responseUrl <- obj .: "response_url"
    status <- obj .: "status"
    pure $ AsyncResponse9{..}

instance ToJSON AsyncResponse9 where
  toJSON AsyncResponse9{..} =
    object [
      "id" .= id,
      "response_url" .= responseUrl,
      "status" .= status
    ]
