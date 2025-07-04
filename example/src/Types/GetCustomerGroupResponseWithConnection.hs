{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.GetCustomerGroupResponseWithConnection where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data GetCustomerGroupResponseWithConnection = GetCustomerGroupResponseWithConnection
  { connection :: Connection
  , customerGroup :: CustomerGroup
  }
  deriving (Show, Eq)

instance FromJSON GetCustomerGroupResponseWithConnection where
  parseJSON = withObject "GetCustomerGroupResponseWithConnection" $ \obj -> do
    connection <- obj .: "connection"
    customerGroup <- obj .: "customer_group"
    pure $ GetCustomerGroupResponseWithConnection{..}

instance ToJSON GetCustomerGroupResponseWithConnection where
  toJSON GetCustomerGroupResponseWithConnection{..} =
    object [
      "connection" .= connection,
      "customer_group" .= customerGroup
    ]
