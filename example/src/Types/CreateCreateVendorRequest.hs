{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateCreateVendorRequest where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AdditionalFields40 (AdditionalFields40)
import Types.Addresses5 (Addresses5)
import Types.CreateVendor (CreateVendor)
import Types.Subsidiaries5 (Subsidiaries5)

data CreateCreateVendorRequest = CreateCreateVendorRequest
  { responseMode :: Text
  , vendor :: CreateVendor
  }
  deriving (Show, Eq)

instance FromJSON CreateCreateVendorRequest where
  parseJSON = withObject "CreateCreateVendorRequest" $ \obj -> do
    responseMode <- obj .: "response_mode"
    vendor <- obj .: "vendor"
    pure $ CreateCreateVendorRequest{..}

instance ToJSON CreateCreateVendorRequest where
  toJSON CreateCreateVendorRequest{..} =
    object [
      "response_mode" .= responseMode,
      "vendor" .= vendor
    ]
