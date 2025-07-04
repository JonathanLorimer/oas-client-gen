{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.LinkedPurchaseOrders1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data LinkedPurchaseOrders1 = LinkedPurchaseOrders1
  { id :: Text
  }
  deriving (Show, Eq)

instance FromJSON LinkedPurchaseOrders1 where
  parseJSON = withObject "LinkedPurchaseOrders1" $ \obj -> do
    id <- obj .: "id"
    pure $ LinkedPurchaseOrders1{..}

instance ToJSON LinkedPurchaseOrders1 where
  toJSON LinkedPurchaseOrders1{..} =
    object [
      "id" .= id
    ]
