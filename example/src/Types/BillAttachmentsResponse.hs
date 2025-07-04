{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.BillAttachmentsResponse where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data BillAttachmentsResponse = BillAttachmentsResponse
  { attachments :: [Attachment]
  }
  deriving (Show, Eq)

instance FromJSON BillAttachmentsResponse where
  parseJSON = withObject "BillAttachmentsResponse" $ \obj -> do
    attachments <- obj .: "attachments"
    pure $ BillAttachmentsResponse{..}

instance ToJSON BillAttachmentsResponse where
  toJSON BillAttachmentsResponse{..} =
    object [
      "attachments" .= attachments
    ]
