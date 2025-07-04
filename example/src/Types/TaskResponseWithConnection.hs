{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.TaskResponseWithConnection where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data TaskResponseWithConnection = TaskResponseWithConnection
  { connection :: Connection
  , task :: Task
  }
  deriving (Show, Eq)

instance FromJSON TaskResponseWithConnection where
  parseJSON = withObject "TaskResponseWithConnection" $ \obj -> do
    connection <- obj .: "connection"
    task <- obj .: "task"
    pure $ TaskResponseWithConnection{..}

instance ToJSON TaskResponseWithConnection where
  toJSON TaskResponseWithConnection{..} =
    object [
      "connection" .= connection,
      "task" .= task
    ]
