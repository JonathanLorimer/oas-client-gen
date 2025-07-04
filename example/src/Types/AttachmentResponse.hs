{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AttachmentResponse where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.Attachment (Attachment)

data AttachmentResponse = AttachmentResponse
  { attachment :: Attachment
  }
  deriving (Show, Eq)

instance FromJSON AttachmentResponse where
  parseJSON = withObject "AttachmentResponse" $ \obj -> do
    attachment <- obj .: "attachment"
    pure $ AttachmentResponse{..}

instance ToJSON AttachmentResponse where
  toJSON AttachmentResponse{..} =
    object [
      "attachment" .= attachment
    ]
