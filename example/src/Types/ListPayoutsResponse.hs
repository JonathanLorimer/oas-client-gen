{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ListPayoutsResponse where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.Destination (Destination)
import Types.OrderTransaction (OrderTransaction)
import Types.Payout (Payout)

data ListPayoutsResponse = ListPayoutsResponse
  { connection :: Connection
  , nextCursor :: Maybe Text
  , payouts :: [Payout]
  }
  deriving (Show, Eq)

instance FromJSON ListPayoutsResponse where
  parseJSON = withObject "ListPayoutsResponse" $ \obj -> do
    connection <- obj .: "connection"
    nextCursor <- obj .: "next_cursor"
    payouts <- obj .: "payouts"
    pure $ ListPayoutsResponse{..}

instance ToJSON ListPayoutsResponse where
  toJSON ListPayoutsResponse{..} =
    object [
      "connection" .= connection,
      "next_cursor" .= nextCursor,
      "payouts" .= payouts
    ]
