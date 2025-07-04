{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Report where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.AdditionalFields36 (AdditionalFields36)
import Types.CompanyInfo20230207 (CompanyInfo20230207)

data Report = Report
  { companyInfo :: CompanyInfo20230207
  , expiresAt :: Text
  , reportUrl :: Text
  }
  deriving (Show, Eq)

instance FromJSON Report where
  parseJSON = withObject "Report" $ \obj -> do
    companyInfo <- obj .: "company_info"
    expiresAt <- obj .: "expires_at"
    reportUrl <- obj .: "report_url"
    pure $ Report{..}

instance ToJSON Report where
  toJSON Report{..} =
    object [
      "company_info" .= companyInfo,
      "expires_at" .= expiresAt,
      "report_url" .= reportUrl
    ]
