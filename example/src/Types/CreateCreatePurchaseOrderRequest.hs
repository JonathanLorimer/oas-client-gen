{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateCreatePurchaseOrderRequest where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AdditionalFields35 (AdditionalFields35)
import Types.CreatePurchaseOrder (CreatePurchaseOrder)
import Types.LineItems17 (LineItems17)

data CreateCreatePurchaseOrderRequest = CreateCreatePurchaseOrderRequest
  { purchaseOrder :: CreatePurchaseOrder
  , responseMode :: Text
  }
  deriving (Show, Eq)

instance FromJSON CreateCreatePurchaseOrderRequest where
  parseJSON = withObject "CreateCreatePurchaseOrderRequest" $ \obj -> do
    purchaseOrder <- obj .: "purchase_order"
    responseMode <- obj .: "response_mode"
    pure $ CreateCreatePurchaseOrderRequest{..}

instance ToJSON CreateCreatePurchaseOrderRequest where
  toJSON CreateCreatePurchaseOrderRequest{..} =
    object [
      "purchase_order" .= purchaseOrder,
      "response_mode" .= responseMode
    ]
