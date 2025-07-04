{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.HrisEmployeeResponseWithConnection where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data HrisEmployeeResponseWithConnection = HrisEmployeeResponseWithConnection
  { connection :: Connection
  , employee :: HrisEmployee
  }
  deriving (Show, Eq)

instance FromJSON HrisEmployeeResponseWithConnection where
  parseJSON = withObject "HrisEmployeeResponseWithConnection" $ \obj -> do
    connection <- obj .: "connection"
    employee <- obj .: "employee"
    pure $ HrisEmployeeResponseWithConnection{..}

instance ToJSON HrisEmployeeResponseWithConnection where
  toJSON HrisEmployeeResponseWithConnection{..} =
    object [
      "connection" .= connection,
      "employee" .= employee
    ]
