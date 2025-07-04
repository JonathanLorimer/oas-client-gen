{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CurrencyResponseWithConnection where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data CurrencyResponseWithConnection = CurrencyResponseWithConnection
  { connection :: Connection
  , currency :: Currency
  }
  deriving (Show, Eq)

instance FromJSON CurrencyResponseWithConnection where
  parseJSON = withObject "CurrencyResponseWithConnection" $ \obj -> do
    connection <- obj .: "connection"
    currency <- obj .: "currency"
    pure $ CurrencyResponseWithConnection{..}

instance ToJSON CurrencyResponseWithConnection where
  toJSON CurrencyResponseWithConnection{..} =
    object [
      "connection" .= connection,
      "currency" .= currency
    ]
