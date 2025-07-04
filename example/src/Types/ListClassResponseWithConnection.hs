{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ListClassResponseWithConnection where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.Class (Class)

data ListClassResponseWithConnection = ListClassResponseWithConnection
  { classes :: [Class]
  , connection :: Connection
  , nextCursor :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON ListClassResponseWithConnection where
  parseJSON = withObject "ListClassResponseWithConnection" $ \obj -> do
    classes <- obj .: "classes"
    connection <- obj .: "connection"
    nextCursor <- obj .: "next_cursor"
    pure $ ListClassResponseWithConnection{..}

instance ToJSON ListClassResponseWithConnection where
  toJSON ListClassResponseWithConnection{..} =
    object [
      "classes" .= classes,
      "connection" .= connection,
      "next_cursor" .= nextCursor
    ]
