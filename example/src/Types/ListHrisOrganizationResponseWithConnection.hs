{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ListHrisOrganizationResponseWithConnection where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.Address (Address)
import Types.HrisOrganization (HrisOrganization)

data ListHrisOrganizationResponseWithConnection = ListHrisOrganizationResponseWithConnection
  { connection :: Connection
  , nextCursor :: Maybe Text
  , organizations :: [HrisOrganization]
  }
  deriving (Show, Eq)

instance FromJSON ListHrisOrganizationResponseWithConnection where
  parseJSON = withObject "ListHrisOrganizationResponseWithConnection" $ \obj -> do
    connection <- obj .: "connection"
    nextCursor <- obj .: "next_cursor"
    organizations <- obj .: "organizations"
    pure $ ListHrisOrganizationResponseWithConnection{..}

instance ToJSON ListHrisOrganizationResponseWithConnection where
  toJSON ListHrisOrganizationResponseWithConnection{..} =
    object [
      "connection" .= connection,
      "next_cursor" .= nextCursor,
      "organizations" .= organizations
    ]
