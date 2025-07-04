{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.PostAttachmentResponse where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data PostAttachmentResponse = PostAttachmentResponse
  { attachment :: Attachment
  }
  deriving (Show, Eq)

instance FromJSON PostAttachmentResponse where
  parseJSON = withObject "PostAttachmentResponse" $ \obj -> do
    attachment <- obj .: "attachment"
    pure $ PostAttachmentResponse{..}

instance ToJSON PostAttachmentResponse where
  toJSON PostAttachmentResponse{..} =
    object [
      "attachment" .= attachment
    ]
