{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.DepartmentResponseWithConnection where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data DepartmentResponseWithConnection = DepartmentResponseWithConnection
  { connection :: Connection
  , department :: Department
  }
  deriving (Show, Eq)

instance FromJSON DepartmentResponseWithConnection where
  parseJSON = withObject "DepartmentResponseWithConnection" $ \obj -> do
    connection <- obj .: "connection"
    department <- obj .: "department"
    pure $ DepartmentResponseWithConnection{..}

instance ToJSON DepartmentResponseWithConnection where
  toJSON DepartmentResponseWithConnection{..} =
    object [
      "connection" .= connection,
      "department" .= department
    ]
