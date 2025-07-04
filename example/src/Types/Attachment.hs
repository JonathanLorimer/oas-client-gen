{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Attachment where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Attachment = Attachment
  { attachedToId :: Maybe Text
  , attachedToType :: Maybe Text
  , createdAt :: Text
  , fileName :: Text
  , fileUrl :: Text
  , id :: Text
  , platformId :: Text
  }
  deriving (Show, Eq)

instance FromJSON Attachment where
  parseJSON = withObject "Attachment" $ \obj -> do
    attachedToId <- obj .: "attached_to_id"
    attachedToType <- obj .: "attached_to_type"
    createdAt <- obj .: "created_at"
    fileName <- obj .: "file_name"
    fileUrl <- obj .: "file_url"
    id <- obj .: "id"
    platformId <- obj .: "platform_id"
    pure $ Attachment{..}

instance ToJSON Attachment where
  toJSON Attachment{..} =
    object [
      "attached_to_id" .= attachedToId,
      "attached_to_type" .= attachedToType,
      "created_at" .= createdAt,
      "file_name" .= fileName,
      "file_url" .= fileUrl,
      "id" .= id,
      "platform_id" .= platformId
    ]
