{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ListSubsidiaryResponseWithConnection where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.Subsidiary (Subsidiary)

data ListSubsidiaryResponseWithConnection = ListSubsidiaryResponseWithConnection
  { connection :: Connection
  , nextCursor :: Maybe Text
  , subsidiaries :: [Subsidiary]
  }
  deriving (Show, Eq)

instance FromJSON ListSubsidiaryResponseWithConnection where
  parseJSON = withObject "ListSubsidiaryResponseWithConnection" $ \obj -> do
    connection <- obj .: "connection"
    nextCursor <- obj .: "next_cursor"
    subsidiaries <- obj .: "subsidiaries"
    pure $ ListSubsidiaryResponseWithConnection{..}

instance ToJSON ListSubsidiaryResponseWithConnection where
  toJSON ListSubsidiaryResponseWithConnection{..} =
    object [
      "connection" .= connection,
      "next_cursor" .= nextCursor,
      "subsidiaries" .= subsidiaries
    ]
