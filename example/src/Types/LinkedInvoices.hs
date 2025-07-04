{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.LinkedInvoices where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data LinkedInvoices = LinkedInvoices
  { allocatedAmount :: Double
  , id :: Text
  }
  deriving (Show, Eq)

instance FromJSON LinkedInvoices where
  parseJSON = withObject "LinkedInvoices" $ \obj -> do
    allocatedAmount <- obj .: "allocated_amount"
    id <- obj .: "id"
    pure $ LinkedInvoices{..}

instance ToJSON LinkedInvoices where
  toJSON LinkedInvoices{..} =
    object [
      "allocated_amount" .= allocatedAmount,
      "id" .= id
    ]
