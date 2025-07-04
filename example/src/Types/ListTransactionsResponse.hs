{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ListTransactionsResponse where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data ListTransactionsResponse = ListTransactionsResponse
  { connection :: Connection
  , nextCursor :: Maybe Text
  , transactions :: Transactions
  }
  deriving (Show, Eq)

instance FromJSON ListTransactionsResponse where
  parseJSON = withObject "ListTransactionsResponse" $ \obj -> do
    connection <- obj .: "connection"
    nextCursor <- obj .: "next_cursor"
    transactions <- obj .: "transactions"
    pure $ ListTransactionsResponse{..}

instance ToJSON ListTransactionsResponse where
  toJSON ListTransactionsResponse{..} =
    object [
      "connection" .= connection,
      "next_cursor" .= nextCursor,
      "transactions" .= transactions
    ]
