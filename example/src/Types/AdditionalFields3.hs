{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AdditionalFields3 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data AdditionalFields3 = AdditionalFields3
  { reconciledForDestinationAccount :: Bool
  , reconciledForSourceAccount :: Bool
  }
  deriving (Show, Eq)

instance FromJSON AdditionalFields3 where
  parseJSON = withObject "AdditionalFields3" $ \obj -> do
    reconciledForDestinationAccount <- obj .: "reconciled_for_destination_account"
    reconciledForSourceAccount <- obj .: "reconciled_for_source_account"
    pure $ AdditionalFields3{..}

instance ToJSON AdditionalFields3 where
  toJSON AdditionalFields3{..} =
    object [
      "reconciled_for_destination_account" .= reconciledForDestinationAccount,
      "reconciled_for_source_account" .= reconciledForSourceAccount
    ]
