{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.LinkedInvoices2 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data LinkedInvoices2 = LinkedInvoices2
  { allocatedAt :: Text
  , amount :: Maybe Text
  , id :: Text
  }
  deriving (Show, Eq)

instance FromJSON LinkedInvoices2 where
  parseJSON = withObject "LinkedInvoices2" $ \obj -> do
    allocatedAt <- obj .: "allocated_at"
    amount <- obj .: "amount"
    id <- obj .: "id"
    pure $ LinkedInvoices2{..}

instance ToJSON LinkedInvoices2 where
  toJSON LinkedInvoices2{..} =
    object [
      "allocated_at" .= allocatedAt,
      "amount" .= amount,
      "id" .= id
    ]
