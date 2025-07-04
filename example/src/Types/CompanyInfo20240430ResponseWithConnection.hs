{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CompanyInfo20240430ResponseWithConnection where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.AdditionalFields13 (AdditionalFields13)
import Types.CompanyInfo20240430 (CompanyInfo20240430)

data CompanyInfo20240430ResponseWithConnection = CompanyInfo20240430ResponseWithConnection
  { companyInfo :: CompanyInfo20240430
  , connection :: Connection
  }
  deriving (Show, Eq)

instance FromJSON CompanyInfo20240430ResponseWithConnection where
  parseJSON = withObject "CompanyInfo20240430ResponseWithConnection" $ \obj -> do
    companyInfo <- obj .: "company_info"
    connection <- obj .: "connection"
    pure $ CompanyInfo20240430ResponseWithConnection{..}

instance ToJSON CompanyInfo20240430ResponseWithConnection where
  toJSON CompanyInfo20240430ResponseWithConnection{..} =
    object [
      "company_info" .= companyInfo,
      "connection" .= connection
    ]
