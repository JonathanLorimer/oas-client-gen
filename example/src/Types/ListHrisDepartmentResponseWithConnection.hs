{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ListHrisDepartmentResponseWithConnection where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.HrisDepartment (HrisDepartment)

data ListHrisDepartmentResponseWithConnection = ListHrisDepartmentResponseWithConnection
  { connection :: Connection
  , departments :: [HrisDepartment]
  , nextCursor :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON ListHrisDepartmentResponseWithConnection where
  parseJSON = withObject "ListHrisDepartmentResponseWithConnection" $ \obj -> do
    connection <- obj .: "connection"
    departments <- obj .: "departments"
    nextCursor <- obj .: "next_cursor"
    pure $ ListHrisDepartmentResponseWithConnection{..}

instance ToJSON ListHrisDepartmentResponseWithConnection where
  toJSON ListHrisDepartmentResponseWithConnection{..} =
    object [
      "connection" .= connection,
      "departments" .= departments,
      "next_cursor" .= nextCursor
    ]
