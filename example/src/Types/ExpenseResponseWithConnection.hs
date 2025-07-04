{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ExpenseResponseWithConnection where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data ExpenseResponseWithConnection = ExpenseResponseWithConnection
  { connection :: Connection
  , expense :: Expense
  }
  deriving (Show, Eq)

instance FromJSON ExpenseResponseWithConnection where
  parseJSON = withObject "ExpenseResponseWithConnection" $ \obj -> do
    connection <- obj .: "connection"
    expense <- obj .: "expense"
    pure $ ExpenseResponseWithConnection{..}

instance ToJSON ExpenseResponseWithConnection where
  toJSON ExpenseResponseWithConnection{..} =
    object [
      "connection" .= connection,
      "expense" .= expense
    ]
