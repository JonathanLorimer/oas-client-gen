{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.SubsidiaryResponseWithConnection where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data SubsidiaryResponseWithConnection = SubsidiaryResponseWithConnection
  { connection :: Connection
  , subsidiary :: Subsidiary
  }
  deriving (Show, Eq)

instance FromJSON SubsidiaryResponseWithConnection where
  parseJSON = withObject "SubsidiaryResponseWithConnection" $ \obj -> do
    connection <- obj .: "connection"
    subsidiary <- obj .: "subsidiary"
    pure $ SubsidiaryResponseWithConnection{..}

instance ToJSON SubsidiaryResponseWithConnection where
  toJSON SubsidiaryResponseWithConnection{..} =
    object [
      "connection" .= connection,
      "subsidiary" .= subsidiary
    ]
