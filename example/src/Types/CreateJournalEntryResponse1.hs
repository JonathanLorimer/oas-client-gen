{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateJournalEntryResponse1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AsyncResponse32 (AsyncResponse32)

data CreateJournalEntryResponse1 = CreateJournalEntryResponse1
  { asyncResponse :: AsyncResponse32
  }
  deriving (Show, Eq)

instance FromJSON CreateJournalEntryResponse1 where
  parseJSON = withObject "CreateJournalEntryResponse1" $ \obj -> do
    asyncResponse <- obj .: "async_response"
    pure $ CreateJournalEntryResponse1{..}

instance ToJSON CreateJournalEntryResponse1 where
  toJSON CreateJournalEntryResponse1{..} =
    object [
      "async_response" .= asyncResponse
    ]
