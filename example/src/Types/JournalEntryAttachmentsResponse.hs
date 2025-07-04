{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.JournalEntryAttachmentsResponse where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data JournalEntryAttachmentsResponse = JournalEntryAttachmentsResponse
  { attachments :: [Attachment]
  }
  deriving (Show, Eq)

instance FromJSON JournalEntryAttachmentsResponse where
  parseJSON = withObject "JournalEntryAttachmentsResponse" $ \obj -> do
    attachments <- obj .: "attachments"
    pure $ JournalEntryAttachmentsResponse{..}

instance ToJSON JournalEntryAttachmentsResponse where
  toJSON JournalEntryAttachmentsResponse{..} =
    object [
      "attachments" .= attachments
    ]
