{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.InvoiceAttachmentsResponse where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data InvoiceAttachmentsResponse = InvoiceAttachmentsResponse
  { attachments :: [Attachment]
  }
  deriving (Show, Eq)

instance FromJSON InvoiceAttachmentsResponse where
  parseJSON = withObject "InvoiceAttachmentsResponse" $ \obj -> do
    attachments <- obj .: "attachments"
    pure $ InvoiceAttachmentsResponse{..}

instance ToJSON InvoiceAttachmentsResponse where
  toJSON InvoiceAttachmentsResponse{..} =
    object [
      "attachments" .= attachments
    ]
