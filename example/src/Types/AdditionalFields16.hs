{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AdditionalFields16 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data AdditionalFields16 = AdditionalFields16
  { salesTaxable :: Bool
  }
  deriving (Show, Eq)

instance FromJSON AdditionalFields16 where
  parseJSON = withObject "AdditionalFields16" $ \obj -> do
    salesTaxable <- obj .: "sales_taxable"
    pure $ AdditionalFields16{..}

instance ToJSON AdditionalFields16 where
  toJSON AdditionalFields16{..} =
    object [
      "sales_taxable" .= salesTaxable
    ]
