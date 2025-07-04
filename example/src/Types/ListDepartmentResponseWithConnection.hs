{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ListDepartmentResponseWithConnection where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.Department (Department)

data ListDepartmentResponseWithConnection = ListDepartmentResponseWithConnection
  { connection :: Connection
  , departments :: [Department]
  , nextCursor :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON ListDepartmentResponseWithConnection where
  parseJSON = withObject "ListDepartmentResponseWithConnection" $ \obj -> do
    connection <- obj .: "connection"
    departments <- obj .: "departments"
    nextCursor <- obj .: "next_cursor"
    pure $ ListDepartmentResponseWithConnection{..}

instance ToJSON ListDepartmentResponseWithConnection where
  toJSON ListDepartmentResponseWithConnection{..} =
    object [
      "connection" .= connection,
      "departments" .= departments,
      "next_cursor" .= nextCursor
    ]
