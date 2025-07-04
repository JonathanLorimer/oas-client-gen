{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.BankDepositAttachmentsResponse where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data BankDepositAttachmentsResponse = BankDepositAttachmentsResponse
  { attachments :: [Attachment]
  }
  deriving (Show, Eq)

instance FromJSON BankDepositAttachmentsResponse where
  parseJSON = withObject "BankDepositAttachmentsResponse" $ \obj -> do
    attachments <- obj .: "attachments"
    pure $ BankDepositAttachmentsResponse{..}

instance ToJSON BankDepositAttachmentsResponse where
  toJSON BankDepositAttachmentsResponse{..} =
    object [
      "attachments" .= attachments
    ]
