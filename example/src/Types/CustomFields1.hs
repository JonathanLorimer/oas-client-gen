{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CustomFields1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data CustomFields1 = CustomFields1
  { lineItemCustomFieldKey :: Text
  }
  deriving (Show, Eq)

instance FromJSON CustomFields1 where
  parseJSON = withObject "CustomFields1" $ \obj -> do
    lineItemCustomFieldKey <- obj .: "line_item_custom_field_key"
    pure $ CustomFields1{..}

instance ToJSON CustomFields1 where
  toJSON CustomFields1{..} =
    object [
      "line_item_custom_field_key" .= lineItemCustomFieldKey
    ]
