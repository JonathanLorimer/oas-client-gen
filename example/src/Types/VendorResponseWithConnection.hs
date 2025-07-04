{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.VendorResponseWithConnection where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data VendorResponseWithConnection = VendorResponseWithConnection
  { connection :: Connection
  , vendor :: Vendor
  }
  deriving (Show, Eq)

instance FromJSON VendorResponseWithConnection where
  parseJSON = withObject "VendorResponseWithConnection" $ \obj -> do
    connection <- obj .: "connection"
    vendor <- obj .: "vendor"
    pure $ VendorResponseWithConnection{..}

instance ToJSON VendorResponseWithConnection where
  toJSON VendorResponseWithConnection{..} =
    object [
      "connection" .= connection,
      "vendor" .= vendor
    ]
