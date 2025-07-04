{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CustomFieldsPageGenericEntityResponse where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.CustomField (CustomField)
import Types.CustomFieldsPageGenericEntity (CustomFieldsPageGenericEntity)
import Types.Options (Options)
import Types.Default (Default)
import Types.Default (Default)

data CustomFieldsPageGenericEntityResponse = CustomFieldsPageGenericEntityResponse
  { customFields :: CustomFieldsPageGenericEntity
  }
  deriving (Show, Eq)

instance FromJSON CustomFieldsPageGenericEntityResponse where
  parseJSON = withObject "CustomFieldsPageGenericEntityResponse" $ \obj -> do
    customFields <- obj .: "custom_fields"
    pure $ CustomFieldsPageGenericEntityResponse{..}

instance ToJSON CustomFieldsPageGenericEntityResponse where
  toJSON CustomFieldsPageGenericEntityResponse{..} =
    object [
      "custom_fields" .= customFields
    ]
