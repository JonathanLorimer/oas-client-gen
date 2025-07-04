{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateEntityWithCustomFieldsPageResponse where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.LineItems22 (LineItems22)
import Types.PlatformData (PlatformData)
import Types.SublistKey (SublistKey)

data CreateEntityWithCustomFieldsPageResponse = CreateEntityWithCustomFieldsPageResponse
  { lineItems :: [LineItems22]
  , otherEntityFields :: Text
  , platformData :: PlatformData
  }
  deriving (Show, Eq)

instance FromJSON CreateEntityWithCustomFieldsPageResponse where
  parseJSON = withObject "CreateEntityWithCustomFieldsPageResponse" $ \obj -> do
    lineItems <- obj .: "line_items"
    otherEntityFields <- obj .: "other_entity_fields"
    platformData <- obj .: "platform_data"
    pure $ CreateEntityWithCustomFieldsPageResponse{..}

instance ToJSON CreateEntityWithCustomFieldsPageResponse where
  toJSON CreateEntityWithCustomFieldsPageResponse{..} =
    object [
      "line_items" .= lineItems,
      "other_entity_fields" .= otherEntityFields,
      "platform_data" .= platformData
    ]
