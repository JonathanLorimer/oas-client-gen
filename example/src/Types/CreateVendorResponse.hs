{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateVendorResponse where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AsyncResponse39 (AsyncResponse39)
import Types.CreateVendorResponse1 (CreateVendorResponse1)

data CreateVendorResponse
  = CreateVendorResponseVariant1 CreateVendorResponse
  | CreateVendorResponseVariant2 CreateVendorResponse1
  deriving (Show, Eq)

instance FromJSON CreateVendorResponse where
  parseJSON value = asum
    [ CreateVendorResponseVariant1 <$> parseJSON value
    , CreateVendorResponseVariant2 <$> parseJSON value
    ]

instance ToJSON CreateVendorResponse where
  toJSON = \case
    CreateVendorResponseVariant1 v1 -> object ["type" .= ("variant1" :: Text), "value" .= v1]
    CreateVendorResponseVariant2 v2 -> object ["type" .= ("variant2" :: Text), "value" .= v2]
