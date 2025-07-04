{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Connections where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Connections = Connections
  { accessToken :: Text
  , createdAt :: Text
  , id :: Text
  , linkUrl :: Text
  , name :: Maybe Text
  , platform :: Text
  , status :: Text
  , updatedAt :: Text
  }
  deriving (Show, Eq)

instance FromJSON Connections where
  parseJSON = withObject "Connections" $ \obj -> do
    accessToken <- obj .: "access_token"
    createdAt <- obj .: "created_at"
    id <- obj .: "id"
    linkUrl <- obj .: "link_url"
    name <- obj .: "name"
    platform <- obj .: "platform"
    status <- obj .: "status"
    updatedAt <- obj .: "updated_at"
    pure $ Connections{..}

instance ToJSON Connections where
  toJSON Connections{..} =
    object [
      "access_token" .= accessToken,
      "created_at" .= createdAt,
      "id" .= id,
      "link_url" .= linkUrl,
      "name" .= name,
      "platform" .= platform,
      "status" .= status,
      "updated_at" .= updatedAt
    ]
