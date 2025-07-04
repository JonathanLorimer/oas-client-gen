{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.LinkedInvoices1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data LinkedInvoices1 = LinkedInvoices1
  { allocatedAmount :: Maybe Text
  , allocatedDate :: Text
  , id :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON LinkedInvoices1 where
  parseJSON = withObject "LinkedInvoices1" $ \obj -> do
    allocatedAmount <- obj .: "allocated_amount"
    allocatedDate <- obj .: "allocated_date"
    id <- obj .: "id"
    pure $ LinkedInvoices1{..}

instance ToJSON LinkedInvoices1 where
  toJSON LinkedInvoices1{..} =
    object [
      "allocated_amount" .= allocatedAmount,
      "allocated_date" .= allocatedDate,
      "id" .= id
    ]
