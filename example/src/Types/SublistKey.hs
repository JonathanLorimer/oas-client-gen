{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.SublistKey where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data SublistKey = SublistKey
  { lineItemCustomFieldKey :: Text
  , otherSublistFields :: Text
  }
  deriving (Show, Eq)

instance FromJSON SublistKey where
  parseJSON = withObject "SublistKey" $ \obj -> do
    lineItemCustomFieldKey <- obj .: "line_item_custom_field_key"
    otherSublistFields <- obj .: "other_sublist_fields"
    pure $ SublistKey{..}

instance ToJSON SublistKey where
  toJSON SublistKey{..} =
    object [
      "line_item_custom_field_key" .= lineItemCustomFieldKey,
      "other_sublist_fields" .= otherSublistFields
    ]
