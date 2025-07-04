{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.LineItems21 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.CustomFields1 (CustomFields1)

data LineItems21 = LineItems21
  { customFields :: CustomFields1
  , otherLineItemFields :: Text
  }
  deriving (Show, Eq)

instance FromJSON LineItems21 where
  parseJSON = withObject "LineItems21" $ \obj -> do
    customFields <- obj .: "custom_fields"
    otherLineItemFields <- obj .: "other_line_item_fields"
    pure $ LineItems21{..}

instance ToJSON LineItems21 where
  toJSON LineItems21{..} =
    object [
      "custom_fields" .= customFields,
      "other_line_item_fields" .= otherLineItemFields
    ]
