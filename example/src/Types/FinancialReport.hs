{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.FinancialReport where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.AdditionalFields36 (AdditionalFields36)
import Types.CompanyInfo20230207 (CompanyInfo20230207)
import Types.Report (Report)

data FinancialReport = FinancialReport
  { report :: Maybe Report
  }
  deriving (Show, Eq)

instance FromJSON FinancialReport where
  parseJSON = withObject "FinancialReport" $ \obj -> do
    report <- obj .: "report"
    pure $ FinancialReport{..}

instance ToJSON FinancialReport where
  toJSON FinancialReport{..} =
    object [
      "report" .= report
    ]
