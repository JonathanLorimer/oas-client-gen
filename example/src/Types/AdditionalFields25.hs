{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AdditionalFields25 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data AdditionalFields25 = AdditionalFields25
  { autoApply :: Bool
  , checkNumber :: Text
  , paymentMethod :: Text
  , reconciled :: Bool
  }
  deriving (Show, Eq)

instance FromJSON AdditionalFields25 where
  parseJSON = withObject "AdditionalFields25" $ \obj -> do
    autoApply <- obj .: "auto_apply"
    checkNumber <- obj .: "check_number"
    paymentMethod <- obj .: "payment_method"
    reconciled <- obj .: "reconciled"
    pure $ AdditionalFields25{..}

instance ToJSON AdditionalFields25 where
  toJSON AdditionalFields25{..} =
    object [
      "auto_apply" .= autoApply,
      "check_number" .= checkNumber,
      "payment_method" .= paymentMethod,
      "reconciled" .= reconciled
    ]
