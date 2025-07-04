{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ListCustomerGroupsResponseWithConnection where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.CustomerGroup (CustomerGroup)

data ListCustomerGroupsResponseWithConnection = ListCustomerGroupsResponseWithConnection
  { connection :: Connection
  , customerGroups :: [CustomerGroup]
  , nextCursor :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON ListCustomerGroupsResponseWithConnection where
  parseJSON = withObject "ListCustomerGroupsResponseWithConnection" $ \obj -> do
    connection <- obj .: "connection"
    customerGroups <- obj .: "customer_groups"
    nextCursor <- obj .: "next_cursor"
    pure $ ListCustomerGroupsResponseWithConnection{..}

instance ToJSON ListCustomerGroupsResponseWithConnection where
  toJSON ListCustomerGroupsResponseWithConnection{..} =
    object [
      "connection" .= connection,
      "customer_groups" .= customerGroups,
      "next_cursor" .= nextCursor
    ]
