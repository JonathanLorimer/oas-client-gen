{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AsynchronousJob where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.Request (Request)
import Types.Response (Response)

data AsynchronousJob = AsynchronousJob
  { id :: Text
  , request :: Request
  , response :: Response
  , status :: Text
  }
  deriving (Show, Eq)

instance FromJSON AsynchronousJob where
  parseJSON = withObject "AsynchronousJob" $ \obj -> do
    id <- obj .: "id"
    request <- obj .: "request"
    response <- obj .: "response"
    status <- obj .: "status"
    pure $ AsynchronousJob{..}

instance ToJSON AsynchronousJob where
  toJSON AsynchronousJob{..} =
    object [
      "id" .= id,
      "request" .= request,
      "response" .= response,
      "status" .= status
    ]
