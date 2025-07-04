{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateAccountingItemResponse1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AsyncResponse30 (AsyncResponse30)

data CreateAccountingItemResponse1 = CreateAccountingItemResponse1
  { asyncResponse :: AsyncResponse30
  }
  deriving (Show, Eq)

instance FromJSON CreateAccountingItemResponse1 where
  parseJSON = withObject "CreateAccountingItemResponse1" $ \obj -> do
    asyncResponse <- obj .: "async_response"
    pure $ CreateAccountingItemResponse1{..}

instance ToJSON CreateAccountingItemResponse1 where
  toJSON CreateAccountingItemResponse1{..} =
    object [
      "async_response" .= asyncResponse
    ]
