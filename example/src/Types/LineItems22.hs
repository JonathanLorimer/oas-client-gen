{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.LineItems22 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data LineItems22 = LineItems22
  { otherLineItemFields :: Text
  }
  deriving (Show, Eq)

instance FromJSON LineItems22 where
  parseJSON = withObject "LineItems22" $ \obj -> do
    otherLineItemFields <- obj .: "other_line_item_fields"
    pure $ LineItems22{..}

instance ToJSON LineItems22 where
  toJSON LineItems22{..} =
    object [
      "other_line_item_fields" .= otherLineItemFields
    ]
