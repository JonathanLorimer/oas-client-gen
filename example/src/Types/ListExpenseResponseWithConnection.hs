{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ListExpenseResponseWithConnection where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.AdditionalFields18 (AdditionalFields18)
import Types.Expense (Expense)
import Types.LineItems8 (LineItems8)

data ListExpenseResponseWithConnection = ListExpenseResponseWithConnection
  { connection :: Connection
  , expenses :: [Expense]
  , nextCursor :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON ListExpenseResponseWithConnection where
  parseJSON = withObject "ListExpenseResponseWithConnection" $ \obj -> do
    connection <- obj .: "connection"
    expenses <- obj .: "expenses"
    nextCursor <- obj .: "next_cursor"
    pure $ ListExpenseResponseWithConnection{..}

instance ToJSON ListExpenseResponseWithConnection where
  toJSON ListExpenseResponseWithConnection{..} =
    object [
      "connection" .= connection,
      "expenses" .= expenses,
      "next_cursor" .= nextCursor
    ]
