{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.HrisDepartmentResponseWithConnection where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data HrisDepartmentResponseWithConnection = HrisDepartmentResponseWithConnection
  { connection :: Connection
  , department :: HrisDepartment
  }
  deriving (Show, Eq)

instance FromJSON HrisDepartmentResponseWithConnection where
  parseJSON = withObject "HrisDepartmentResponseWithConnection" $ \obj -> do
    connection <- obj .: "connection"
    department <- obj .: "department"
    pure $ HrisDepartmentResponseWithConnection{..}

instance ToJSON HrisDepartmentResponseWithConnection where
  toJSON HrisDepartmentResponseWithConnection{..} =
    object [
      "connection" .= connection,
      "department" .= department
    ]
