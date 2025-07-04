{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Item where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Item = Item
  { id :: Maybe Text
  , quantity :: Maybe Double
  , unitAmount :: Maybe Double
  }
  deriving (Show, Eq)

instance FromJSON Item where
  parseJSON = withObject "Item" $ \obj -> do
    id <- obj .: "id"
    quantity <- obj .: "quantity"
    unitAmount <- obj .: "unit_amount"
    pure $ Item{..}

instance ToJSON Item where
  toJSON Item{..} =
    object [
      "id" .= id,
      "quantity" .= quantity,
      "unit_amount" .= unitAmount
    ]
