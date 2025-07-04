{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.LinkedPurchaseOrders where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data LinkedPurchaseOrders = LinkedPurchaseOrders
  { id :: Text
  }
  deriving (Show, Eq)

instance FromJSON LinkedPurchaseOrders where
  parseJSON = withObject "LinkedPurchaseOrders" $ \obj -> do
    id <- obj .: "id"
    pure $ LinkedPurchaseOrders{..}

instance ToJSON LinkedPurchaseOrders where
  toJSON LinkedPurchaseOrders{..} =
    object [
      "id" .= id
    ]
