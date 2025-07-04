{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AdditionalFields30 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data AdditionalFields30 = AdditionalFields30
  { discountAccountId :: Text
  , inventoryStartDate :: Text
  , itemId :: Text
  , quantityOnHandAdjustmentAccountId :: Text
  }
  deriving (Show, Eq)

instance FromJSON AdditionalFields30 where
  parseJSON = withObject "AdditionalFields30" $ \obj -> do
    discountAccountId <- obj .: "discount_account_id"
    inventoryStartDate <- obj .: "inventory_start_date"
    itemId <- obj .: "item_id"
    quantityOnHandAdjustmentAccountId <- obj .: "quantity_on_hand_adjustment_account_id"
    pure $ AdditionalFields30{..}

instance ToJSON AdditionalFields30 where
  toJSON AdditionalFields30{..} =
    object [
      "discount_account_id" .= discountAccountId,
      "inventory_start_date" .= inventoryStartDate,
      "item_id" .= itemId,
      "quantity_on_hand_adjustment_account_id" .= quantityOnHandAdjustmentAccountId
    ]
