{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AdditionalFields40 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data AdditionalFields40 = AdditionalFields40
  { defaultPayablesAccountId :: Text
  }
  deriving (Show, Eq)

instance FromJSON AdditionalFields40 where
  parseJSON = withObject "AdditionalFields40" $ \obj -> do
    defaultPayablesAccountId <- obj .: "default_payables_account_id"
    pure $ AdditionalFields40{..}

instance ToJSON AdditionalFields40 where
  toJSON AdditionalFields40{..} =
    object [
      "default_payables_account_id" .= defaultPayablesAccountId
    ]
