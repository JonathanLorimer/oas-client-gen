{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.BillItem where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data BillItem = BillItem
  { description :: Maybe Text
  , unitPrice :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON BillItem where
  parseJSON = withObject "BillItem" $ \obj -> do
    description <- obj .: "description"
    unitPrice <- obj .: "unit_price"
    pure $ BillItem{..}

instance ToJSON BillItem where
  toJSON BillItem{..} =
    object [
      "description" .= description,
      "unit_price" .= unitPrice
    ]
