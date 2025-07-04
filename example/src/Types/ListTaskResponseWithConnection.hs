{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ListTaskResponseWithConnection where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.Task (Task)

data ListTaskResponseWithConnection = ListTaskResponseWithConnection
  { connection :: Connection
  , nextCursor :: Maybe Text
  , tasks :: [Task]
  }
  deriving (Show, Eq)

instance FromJSON ListTaskResponseWithConnection where
  parseJSON = withObject "ListTaskResponseWithConnection" $ \obj -> do
    connection <- obj .: "connection"
    nextCursor <- obj .: "next_cursor"
    tasks <- obj .: "tasks"
    pure $ ListTaskResponseWithConnection{..}

instance ToJSON ListTaskResponseWithConnection where
  toJSON ListTaskResponseWithConnection{..} =
    object [
      "connection" .= connection,
      "next_cursor" .= nextCursor,
      "tasks" .= tasks
    ]
