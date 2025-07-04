{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AsyncDeleteItemResponse1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AsyncResponse31 (AsyncResponse31)

data AsyncDeleteItemResponse1 = AsyncDeleteItemResponse1
  { asyncResponse :: AsyncResponse31
  }
  deriving (Show, Eq)

instance FromJSON AsyncDeleteItemResponse1 where
  parseJSON = withObject "AsyncDeleteItemResponse1" $ \obj -> do
    asyncResponse <- obj .: "async_response"
    pure $ AsyncDeleteItemResponse1{..}

instance ToJSON AsyncDeleteItemResponse1 where
  toJSON AsyncDeleteItemResponse1{..} =
    object [
      "async_response" .= asyncResponse
    ]
