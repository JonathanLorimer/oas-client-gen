{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AdditionalFields15 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data AdditionalFields15 = AdditionalFields15
  { taxInclusive :: Bool
  }
  deriving (Show, Eq)

instance FromJSON AdditionalFields15 where
  parseJSON = withObject "AdditionalFields15" $ \obj -> do
    taxInclusive <- obj .: "tax_inclusive"
    pure $ AdditionalFields15{..}

instance ToJSON AdditionalFields15 where
  toJSON AdditionalFields15{..} =
    object [
      "tax_inclusive" .= taxInclusive
    ]
