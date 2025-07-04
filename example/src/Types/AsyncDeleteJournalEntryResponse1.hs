{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AsyncDeleteJournalEntryResponse1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AsyncResponse33 (AsyncResponse33)

data AsyncDeleteJournalEntryResponse1 = AsyncDeleteJournalEntryResponse1
  { asyncResponse :: AsyncResponse33
  }
  deriving (Show, Eq)

instance FromJSON AsyncDeleteJournalEntryResponse1 where
  parseJSON = withObject "AsyncDeleteJournalEntryResponse1" $ \obj -> do
    asyncResponse <- obj .: "async_response"
    pure $ AsyncDeleteJournalEntryResponse1{..}

instance ToJSON AsyncDeleteJournalEntryResponse1 where
  toJSON AsyncDeleteJournalEntryResponse1{..} =
    object [
      "async_response" .= asyncResponse
    ]
