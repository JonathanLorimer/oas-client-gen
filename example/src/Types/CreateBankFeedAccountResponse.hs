{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateBankFeedAccountResponse where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AsyncResponse4 (AsyncResponse4)
import Types.CreateBankFeedAccountResponse1 (CreateBankFeedAccountResponse1)

data CreateBankFeedAccountResponse
  = CreateBankFeedAccountResponseVariant1 CreateBankFeedAccountResponse
  | CreateBankFeedAccountResponseVariant2 CreateBankFeedAccountResponse1
  deriving (Show, Eq)

instance FromJSON CreateBankFeedAccountResponse where
  parseJSON value = asum
    [ CreateBankFeedAccountResponseVariant1 <$> parseJSON value
    , CreateBankFeedAccountResponseVariant2 <$> parseJSON value
    ]

instance ToJSON CreateBankFeedAccountResponse where
  toJSON = \case
    CreateBankFeedAccountResponseVariant1 v1 -> object ["type" .= ("variant1" :: Text), "value" .= v1]
    CreateBankFeedAccountResponseVariant2 v2 -> object ["type" .= ("variant2" :: Text), "value" .= v2]
