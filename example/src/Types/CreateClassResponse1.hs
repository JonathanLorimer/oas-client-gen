{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateClassResponse1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AsyncResponse15 (AsyncResponse15)

data CreateClassResponse1 = CreateClassResponse1
  { asyncResponse :: AsyncResponse15
  }
  deriving (Show, Eq)

instance FromJSON CreateClassResponse1 where
  parseJSON = withObject "CreateClassResponse1" $ \obj -> do
    asyncResponse <- obj .: "async_response"
    pure $ CreateClassResponse1{..}

instance ToJSON CreateClassResponse1 where
  toJSON CreateClassResponse1{..} =
    object [
      "async_response" .= asyncResponse
    ]
