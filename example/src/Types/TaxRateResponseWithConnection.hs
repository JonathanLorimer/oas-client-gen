{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.TaxRateResponseWithConnection where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data TaxRateResponseWithConnection = TaxRateResponseWithConnection
  { connection :: Connection
  , taxRate :: TaxRate
  }
  deriving (Show, Eq)

instance FromJSON TaxRateResponseWithConnection where
  parseJSON = withObject "TaxRateResponseWithConnection" $ \obj -> do
    connection <- obj .: "connection"
    taxRate <- obj .: "tax_rate"
    pure $ TaxRateResponseWithConnection{..}

instance ToJSON TaxRateResponseWithConnection where
  toJSON TaxRateResponseWithConnection{..} =
    object [
      "connection" .= connection,
      "tax_rate" .= taxRate
    ]
