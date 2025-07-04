{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.GetCustomerResponse where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data GetCustomerResponse = GetCustomerResponse
  { connection :: Connection
  , customer :: Customer
  }
  deriving (Show, Eq)

instance FromJSON GetCustomerResponse where
  parseJSON = withObject "GetCustomerResponse" $ \obj -> do
    connection <- obj .: "connection"
    customer <- obj .: "customer"
    pure $ GetCustomerResponse{..}

instance ToJSON GetCustomerResponse where
  toJSON GetCustomerResponse{..} =
    object [
      "connection" .= connection,
      "customer" .= customer
    ]
