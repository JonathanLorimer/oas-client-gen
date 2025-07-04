{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CustomerGroup where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data CustomerGroup = CustomerGroup
  { createdAt :: Text
  , id :: Text
  , name :: Maybe Text
  , platformId :: Maybe Text
  , updatedAt :: Text
  }
  deriving (Show, Eq)

instance FromJSON CustomerGroup where
  parseJSON = withObject "CustomerGroup" $ \obj -> do
    createdAt <- obj .: "created_at"
    id <- obj .: "id"
    name <- obj .: "name"
    platformId <- obj .: "platform_id"
    updatedAt <- obj .: "updated_at"
    pure $ CustomerGroup{..}

instance ToJSON CustomerGroup where
  toJSON CustomerGroup{..} =
    object [
      "created_at" .= createdAt,
      "id" .= id,
      "name" .= name,
      "platform_id" .= platformId,
      "updated_at" .= updatedAt
    ]
