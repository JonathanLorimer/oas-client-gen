{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.InvoiceItem where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data InvoiceItem = InvoiceItem
  { description :: Maybe Text
  , unitPrice :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON InvoiceItem where
  parseJSON = withObject "InvoiceItem" $ \obj -> do
    description <- obj .: "description"
    unitPrice <- obj .: "unit_price"
    pure $ InvoiceItem{..}

instance ToJSON InvoiceItem where
  toJSON InvoiceItem{..} =
    object [
      "description" .= description,
      "unit_price" .= unitPrice
    ]
