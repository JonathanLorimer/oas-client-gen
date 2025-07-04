{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AdditionalFields where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data AdditionalFields = AdditionalFields
  { bankAccountNumber :: Text
  }
  deriving (Show, Eq)

instance FromJSON AdditionalFields where
  parseJSON = withObject "AdditionalFields" $ \obj -> do
    bankAccountNumber <- obj .: "bank_account_number"
    pure $ AdditionalFields{..}

instance ToJSON AdditionalFields where
  toJSON AdditionalFields{..} =
    object [
      "bank_account_number" .= bankAccountNumber
    ]
