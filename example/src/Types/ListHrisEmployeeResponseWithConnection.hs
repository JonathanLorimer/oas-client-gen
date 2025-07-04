{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ListHrisEmployeeResponseWithConnection where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.HrisEmployee (HrisEmployee)

data ListHrisEmployeeResponseWithConnection = ListHrisEmployeeResponseWithConnection
  { connection :: Connection
  , employees :: [HrisEmployee]
  , nextCursor :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON ListHrisEmployeeResponseWithConnection where
  parseJSON = withObject "ListHrisEmployeeResponseWithConnection" $ \obj -> do
    connection <- obj .: "connection"
    employees <- obj .: "employees"
    nextCursor <- obj .: "next_cursor"
    pure $ ListHrisEmployeeResponseWithConnection{..}

instance ToJSON ListHrisEmployeeResponseWithConnection where
  toJSON ListHrisEmployeeResponseWithConnection{..} =
    object [
      "connection" .= connection,
      "employees" .= employees,
      "next_cursor" .= nextCursor
    ]
