{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateVendorResponse1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AsyncResponse39 (AsyncResponse39)

data CreateVendorResponse1 = CreateVendorResponse1
  { asyncResponse :: AsyncResponse39
  }
  deriving (Show, Eq)

instance FromJSON CreateVendorResponse1 where
  parseJSON = withObject "CreateVendorResponse1" $ \obj -> do
    asyncResponse <- obj .: "async_response"
    pure $ CreateVendorResponse1{..}

instance ToJSON CreateVendorResponse1 where
  toJSON CreateVendorResponse1{..} =
    object [
      "async_response" .= asyncResponse
    ]
