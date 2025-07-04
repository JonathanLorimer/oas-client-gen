{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.BillResponseWithConnection where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data BillResponseWithConnection = BillResponseWithConnection
  { bill :: Bill
  , connection :: Connection
  }
  deriving (Show, Eq)

instance FromJSON BillResponseWithConnection where
  parseJSON = withObject "BillResponseWithConnection" $ \obj -> do
    bill <- obj .: "bill"
    connection <- obj .: "connection"
    pure $ BillResponseWithConnection{..}

instance ToJSON BillResponseWithConnection where
  toJSON BillResponseWithConnection{..} =
    object [
      "bill" .= bill,
      "connection" .= connection
    ]
