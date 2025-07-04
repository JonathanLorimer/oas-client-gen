{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.BankTransferAttachmentsResponse where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data BankTransferAttachmentsResponse = BankTransferAttachmentsResponse
  { attachments :: [Attachment]
  }
  deriving (Show, Eq)

instance FromJSON BankTransferAttachmentsResponse where
  parseJSON = withObject "BankTransferAttachmentsResponse" $ \obj -> do
    attachments <- obj .: "attachments"
    pure $ BankTransferAttachmentsResponse{..}

instance ToJSON BankTransferAttachmentsResponse where
  toJSON BankTransferAttachmentsResponse{..} =
    object [
      "attachments" .= attachments
    ]
