{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.PurchaseOrderResponseWithConnection where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data PurchaseOrderResponseWithConnection = PurchaseOrderResponseWithConnection
  { connection :: Connection
  , purchaseOrder :: PurchaseOrder
  }
  deriving (Show, Eq)

instance FromJSON PurchaseOrderResponseWithConnection where
  parseJSON = withObject "PurchaseOrderResponseWithConnection" $ \obj -> do
    connection <- obj .: "connection"
    purchaseOrder <- obj .: "purchase_order"
    pure $ PurchaseOrderResponseWithConnection{..}

instance ToJSON PurchaseOrderResponseWithConnection where
  toJSON PurchaseOrderResponseWithConnection{..} =
    object [
      "connection" .= connection,
      "purchase_order" .= purchaseOrder
    ]
