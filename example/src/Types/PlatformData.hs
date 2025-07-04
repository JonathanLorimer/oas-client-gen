{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.PlatformData where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.SublistKey (SublistKey)

data PlatformData = PlatformData
  { customFieldKey :: Text
  , otherPlatformFields :: Text
  , sublistKey :: [SublistKey]
  }
  deriving (Show, Eq)

instance FromJSON PlatformData where
  parseJSON = withObject "PlatformData" $ \obj -> do
    customFieldKey <- obj .: "custom_field_key"
    otherPlatformFields <- obj .: "other_platform_fields"
    sublistKey <- obj .: "sublist_key"
    pure $ PlatformData{..}

instance ToJSON PlatformData where
  toJSON PlatformData{..} =
    object [
      "custom_field_key" .= customFieldKey,
      "other_platform_fields" .= otherPlatformFields,
      "sublist_key" .= sublistKey
    ]
