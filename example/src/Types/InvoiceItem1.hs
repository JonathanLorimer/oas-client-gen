{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.InvoiceItem1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data InvoiceItem1 = InvoiceItem1
  { accountId :: Text
  , description :: Text
  , unitPrice :: Text
  }
  deriving (Show, Eq)

instance FromJSON InvoiceItem1 where
  parseJSON = withObject "InvoiceItem1" $ \obj -> do
    accountId <- obj .: "account_id"
    description <- obj .: "description"
    unitPrice <- obj .: "unit_price"
    pure $ InvoiceItem1{..}

instance ToJSON InvoiceItem1 where
  toJSON InvoiceItem1{..} =
    object [
      "account_id" .= accountId,
      "description" .= description,
      "unit_price" .= unitPrice
    ]
