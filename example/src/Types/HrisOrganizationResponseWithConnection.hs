{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.HrisOrganizationResponseWithConnection where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data HrisOrganizationResponseWithConnection = HrisOrganizationResponseWithConnection
  { connection :: Connection
  , organization :: HrisOrganization
  }
  deriving (Show, Eq)

instance FromJSON HrisOrganizationResponseWithConnection where
  parseJSON = withObject "HrisOrganizationResponseWithConnection" $ \obj -> do
    connection <- obj .: "connection"
    organization <- obj .: "organization"
    pure $ HrisOrganizationResponseWithConnection{..}

instance ToJSON HrisOrganizationResponseWithConnection where
  toJSON HrisOrganizationResponseWithConnection{..} =
    object [
      "connection" .= connection,
      "organization" .= organization
    ]
