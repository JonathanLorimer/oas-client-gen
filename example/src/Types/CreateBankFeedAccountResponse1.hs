{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateBankFeedAccountResponse1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AsyncResponse4 (AsyncResponse4)

data CreateBankFeedAccountResponse1 = CreateBankFeedAccountResponse1
  { asyncResponse :: AsyncResponse4
  }
  deriving (Show, Eq)

instance FromJSON CreateBankFeedAccountResponse1 where
  parseJSON = withObject "CreateBankFeedAccountResponse1" $ \obj -> do
    asyncResponse <- obj .: "async_response"
    pure $ CreateBankFeedAccountResponse1{..}

instance ToJSON CreateBankFeedAccountResponse1 where
  toJSON CreateBankFeedAccountResponse1{..} =
    object [
      "async_response" .= asyncResponse
    ]
