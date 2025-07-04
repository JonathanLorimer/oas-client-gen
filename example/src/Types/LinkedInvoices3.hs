{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.LinkedInvoices3 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data LinkedInvoices3 = LinkedInvoices3
  { allocatedAt :: Text
  , amount :: Double
  , id :: Text
  }
  deriving (Show, Eq)

instance FromJSON LinkedInvoices3 where
  parseJSON = withObject "LinkedInvoices3" $ \obj -> do
    allocatedAt <- obj .: "allocated_at"
    amount <- obj .: "amount"
    id <- obj .: "id"
    pure $ LinkedInvoices3{..}

instance ToJSON LinkedInvoices3 where
  toJSON LinkedInvoices3{..} =
    object [
      "allocated_at" .= allocatedAt,
      "amount" .= amount,
      "id" .= id
    ]
