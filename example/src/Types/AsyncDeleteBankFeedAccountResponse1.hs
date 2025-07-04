{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AsyncDeleteBankFeedAccountResponse1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AsyncResponse5 (AsyncResponse5)

data AsyncDeleteBankFeedAccountResponse1 = AsyncDeleteBankFeedAccountResponse1
  { asyncResponse :: AsyncResponse5
  }
  deriving (Show, Eq)

instance FromJSON AsyncDeleteBankFeedAccountResponse1 where
  parseJSON = withObject "AsyncDeleteBankFeedAccountResponse1" $ \obj -> do
    asyncResponse <- obj .: "async_response"
    pure $ AsyncDeleteBankFeedAccountResponse1{..}

instance ToJSON AsyncDeleteBankFeedAccountResponse1 where
  toJSON AsyncDeleteBankFeedAccountResponse1{..} =
    object [
      "async_response" .= asyncResponse
    ]
