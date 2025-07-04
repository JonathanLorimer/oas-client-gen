{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ListSubscriptionsResponse where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.Subscription (Subscription)
import Types.SubscriptionItem (SubscriptionItem)

data ListSubscriptionsResponse = ListSubscriptionsResponse
  { connection :: Connection
  , nextCursor :: Maybe Text
  , subscriptions :: [Subscription]
  }
  deriving (Show, Eq)

instance FromJSON ListSubscriptionsResponse where
  parseJSON = withObject "ListSubscriptionsResponse" $ \obj -> do
    connection <- obj .: "connection"
    nextCursor <- obj .: "next_cursor"
    subscriptions <- obj .: "subscriptions"
    pure $ ListSubscriptionsResponse{..}

instance ToJSON ListSubscriptionsResponse where
  toJSON ListSubscriptionsResponse{..} =
    object [
      "connection" .= connection,
      "next_cursor" .= nextCursor,
      "subscriptions" .= subscriptions
    ]
