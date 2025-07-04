{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AdditionalFields42 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data AdditionalFields42 = AdditionalFields42
  { notifyCustomer :: Bool
  }
  deriving (Show, Eq)

instance FromJSON AdditionalFields42 where
  parseJSON = withObject "AdditionalFields42" $ \obj -> do
    notifyCustomer <- obj .: "notify_customer"
    pure $ AdditionalFields42{..}

instance ToJSON AdditionalFields42 where
  toJSON AdditionalFields42{..} =
    object [
      "notify_customer" .= notifyCustomer
    ]
