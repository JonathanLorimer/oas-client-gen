{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ListCurrencyResponseWithConnection where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.Currency (Currency)

data ListCurrencyResponseWithConnection = ListCurrencyResponseWithConnection
  { connection :: Connection
  , currencies :: [Currency]
  , nextCursor :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON ListCurrencyResponseWithConnection where
  parseJSON = withObject "ListCurrencyResponseWithConnection" $ \obj -> do
    connection <- obj .: "connection"
    currencies <- obj .: "currencies"
    nextCursor <- obj .: "next_cursor"
    pure $ ListCurrencyResponseWithConnection{..}

instance ToJSON ListCurrencyResponseWithConnection where
  toJSON ListCurrencyResponseWithConnection{..} =
    object [
      "connection" .= connection,
      "currencies" .= currencies,
      "next_cursor" .= nextCursor
    ]
