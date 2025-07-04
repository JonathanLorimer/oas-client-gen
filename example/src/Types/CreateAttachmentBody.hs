{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateAttachmentBody where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data CreateAttachmentBody = CreateAttachmentBody
  { file :: Text
  , fileName :: Text
  }
  deriving (Show, Eq)

instance FromJSON CreateAttachmentBody where
  parseJSON = withObject "CreateAttachmentBody" $ \obj -> do
    file <- obj .: "file"
    fileName <- obj .: "file_name"
    pure $ CreateAttachmentBody{..}

instance ToJSON CreateAttachmentBody where
  toJSON CreateAttachmentBody{..} =
    object [
      "file" .= file,
      "file_name" .= fileName
    ]
