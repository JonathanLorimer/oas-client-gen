{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateEntityWithCustomFieldsPage where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.CustomFields (CustomFields)
import Types.CustomFields1 (CustomFields1)
import Types.LineItems21 (LineItems21)

data CreateEntityWithCustomFieldsPage = CreateEntityWithCustomFieldsPage
  { customFields :: CustomFields
  , lineItems :: [LineItems21]
  , otherEntityFields :: Text
  }
  deriving (Show, Eq)

instance FromJSON CreateEntityWithCustomFieldsPage where
  parseJSON = withObject "CreateEntityWithCustomFieldsPage" $ \obj -> do
    customFields <- obj .: "custom_fields"
    lineItems <- obj .: "line_items"
    otherEntityFields <- obj .: "other_entity_fields"
    pure $ CreateEntityWithCustomFieldsPage{..}

instance ToJSON CreateEntityWithCustomFieldsPage where
  toJSON CreateEntityWithCustomFieldsPage{..} =
    object [
      "custom_fields" .= customFields,
      "line_items" .= lineItems,
      "other_entity_fields" .= otherEntityFields
    ]
