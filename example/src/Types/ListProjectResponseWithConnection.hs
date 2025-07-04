{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ListProjectResponseWithConnection where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.Project (Project)

data ListProjectResponseWithConnection = ListProjectResponseWithConnection
  { connection :: Connection
  , nextCursor :: Maybe Text
  , projects :: [Project]
  }
  deriving (Show, Eq)

instance FromJSON ListProjectResponseWithConnection where
  parseJSON = withObject "ListProjectResponseWithConnection" $ \obj -> do
    connection <- obj .: "connection"
    nextCursor <- obj .: "next_cursor"
    projects <- obj .: "projects"
    pure $ ListProjectResponseWithConnection{..}

instance ToJSON ListProjectResponseWithConnection where
  toJSON ListProjectResponseWithConnection{..} =
    object [
      "connection" .= connection,
      "next_cursor" .= nextCursor,
      "projects" .= projects
    ]
