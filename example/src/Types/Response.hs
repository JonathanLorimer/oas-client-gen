{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Response where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)


data Response = Response
  { body :: Map Text Value
  , httpStatus :: Double
  }
  deriving (Show, Eq)

instance FromJSON Response where
  parseJSON = withObject "Response" $ \obj -> do
    body <- obj .: "body"
    httpStatus <- obj .: "http_status"
    pure $ Response{..}

instance ToJSON Response where
  toJSON Response{..} =
    object [
      "body" .= body,
      "http_status" .= httpStatus
    ]
