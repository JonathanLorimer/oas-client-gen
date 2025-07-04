{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateCreateItemRequest where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AdditionalFields30 (AdditionalFields30)
import Types.BillItem1 (BillItem1)
import Types.CreateItem (CreateItem)
import Types.InvoiceItem1 (InvoiceItem1)

data CreateCreateItemRequest = CreateCreateItemRequest
  { item :: CreateItem
  , responseMode :: Text
  }
  deriving (Show, Eq)

instance FromJSON CreateCreateItemRequest where
  parseJSON = withObject "CreateCreateItemRequest" $ \obj -> do
    item <- obj .: "item"
    responseMode <- obj .: "response_mode"
    pure $ CreateCreateItemRequest{..}

instance ToJSON CreateCreateItemRequest where
  toJSON CreateCreateItemRequest{..} =
    object [
      "item" .= item,
      "response_mode" .= responseMode
    ]
