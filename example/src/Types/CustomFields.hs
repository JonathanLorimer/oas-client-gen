{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CustomFields where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data CustomFields = CustomFields
  { customFieldKey :: Text
  }
  deriving (Show, Eq)

instance FromJSON CustomFields where
  parseJSON = withObject "CustomFields" $ \obj -> do
    customFieldKey <- obj .: "custom_field_key"
    pure $ CustomFields{..}

instance ToJSON CustomFields where
  toJSON CustomFields{..} =
    object [
      "custom_field_key" .= customFieldKey
    ]
