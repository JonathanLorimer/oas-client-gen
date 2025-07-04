{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AdditionalFields14 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data AdditionalFields14 = AdditionalFields14
  { salesTaxable :: Bool
  }
  deriving (Show, Eq)

instance FromJSON AdditionalFields14 where
  parseJSON = withObject "AdditionalFields14" $ \obj -> do
    salesTaxable <- obj .: "sales_taxable"
    pure $ AdditionalFields14{..}

instance ToJSON AdditionalFields14 where
  toJSON AdditionalFields14{..} =
    object [
      "sales_taxable" .= salesTaxable
    ]
