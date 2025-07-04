{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CustomFieldsPageGenericEntity where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.CustomField (CustomField)
import Types.Options (Options)
import Types.Default (Default)
import Types.Default (Default)

data CustomFieldsPageGenericEntity = CustomFieldsPageGenericEntity
  { entity :: [CustomField]
  , entity.lineItems :: [CustomField]
  }
  deriving (Show, Eq)

instance FromJSON CustomFieldsPageGenericEntity where
  parseJSON = withObject "CustomFieldsPageGenericEntity" $ \obj -> do
    entity <- obj .: "entity"
    entity.lineItems <- obj .: "entity.line_items"
    pure $ CustomFieldsPageGenericEntity{..}

instance ToJSON CustomFieldsPageGenericEntity where
  toJSON CustomFieldsPageGenericEntity{..} =
    object [
      "entity" .= entity,
      "entity.line_items" .= entity.lineItems
    ]
