{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ProjectResponseWithConnection where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data ProjectResponseWithConnection = ProjectResponseWithConnection
  { connection :: Connection
  , project :: Project
  }
  deriving (Show, Eq)

instance FromJSON ProjectResponseWithConnection where
  parseJSON = withObject "ProjectResponseWithConnection" $ \obj -> do
    connection <- obj .: "connection"
    project <- obj .: "project"
    pure $ ProjectResponseWithConnection{..}

instance ToJSON ProjectResponseWithConnection where
  toJSON ProjectResponseWithConnection{..} =
    object [
      "connection" .= connection,
      "project" .= project
    ]
