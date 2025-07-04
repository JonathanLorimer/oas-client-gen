{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateAccountResponse1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AsyncResponse (AsyncResponse)

data CreateAccountResponse1 = CreateAccountResponse1
  { asyncResponse :: AsyncResponse
  }
  deriving (Show, Eq)

instance FromJSON CreateAccountResponse1 where
  parseJSON = withObject "CreateAccountResponse1" $ \obj -> do
    asyncResponse <- obj .: "async_response"
    pure $ CreateAccountResponse1{..}

instance ToJSON CreateAccountResponse1 where
  toJSON CreateAccountResponse1{..} =
    object [
      "async_response" .= asyncResponse
    ]
