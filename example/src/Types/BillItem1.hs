{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.BillItem1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data BillItem1 = BillItem1
  { accountId :: Text
  , description :: Text
  , unitPrice :: Text
  }
  deriving (Show, Eq)

instance FromJSON BillItem1 where
  parseJSON = withObject "BillItem1" $ \obj -> do
    accountId <- obj .: "account_id"
    description <- obj .: "description"
    unitPrice <- obj .: "unit_price"
    pure $ BillItem1{..}

instance ToJSON BillItem1 where
  toJSON BillItem1{..} =
    object [
      "account_id" .= accountId,
      "description" .= description,
      "unit_price" .= unitPrice
    ]
