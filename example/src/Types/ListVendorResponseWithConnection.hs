{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ListVendorResponseWithConnection where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.Addresses4 (Addresses4)
import Types.Subsidiaries4 (Subsidiaries4)
import Types.Vendor (Vendor)

data ListVendorResponseWithConnection = ListVendorResponseWithConnection
  { connection :: Connection
  , nextCursor :: Maybe Text
  , vendors :: [Vendor]
  }
  deriving (Show, Eq)

instance FromJSON ListVendorResponseWithConnection where
  parseJSON = withObject "ListVendorResponseWithConnection" $ \obj -> do
    connection <- obj .: "connection"
    nextCursor <- obj .: "next_cursor"
    vendors <- obj .: "vendors"
    pure $ ListVendorResponseWithConnection{..}

instance ToJSON ListVendorResponseWithConnection where
  toJSON ListVendorResponseWithConnection{..} =
    object [
      "connection" .= connection,
      "next_cursor" .= nextCursor,
      "vendors" .= vendors
    ]
