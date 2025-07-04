{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ListCustomersResponse where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.Customer (Customer)
import Types.Orders1 (Orders1)

data ListCustomersResponse = ListCustomersResponse
  { connection :: Connection
  , customers :: [Customer]
  , nextCursor :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON ListCustomersResponse where
  parseJSON = withObject "ListCustomersResponse" $ \obj -> do
    connection <- obj .: "connection"
    customers <- obj .: "customers"
    nextCursor <- obj .: "next_cursor"
    pure $ ListCustomersResponse{..}

instance ToJSON ListCustomersResponse where
  toJSON ListCustomersResponse{..} =
    object [
      "connection" .= connection,
      "customers" .= customers,
      "next_cursor" .= nextCursor
    ]
