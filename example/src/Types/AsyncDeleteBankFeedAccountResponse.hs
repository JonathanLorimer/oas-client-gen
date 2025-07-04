{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AsyncDeleteBankFeedAccountResponse where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AsyncDeleteBankFeedAccountResponse1 (AsyncDeleteBankFeedAccountResponse1)
import Types.AsyncResponse5 (AsyncResponse5)

data AsyncDeleteBankFeedAccountResponse
  = AsyncDeleteBankFeedAccountResponseVariant1 AsyncDeleteBankFeedAccountResponse
  | AsyncDeleteBankFeedAccountResponseVariant2 AsyncDeleteBankFeedAccountResponse1
  deriving (Show, Eq)

instance FromJSON AsyncDeleteBankFeedAccountResponse where
  parseJSON value = asum
    [ AsyncDeleteBankFeedAccountResponseVariant1 <$> parseJSON value
    , AsyncDeleteBankFeedAccountResponseVariant2 <$> parseJSON value
    ]

instance ToJSON AsyncDeleteBankFeedAccountResponse where
  toJSON = \case
    AsyncDeleteBankFeedAccountResponseVariant1 v1 -> object ["type" .= ("variant1" :: Text), "value" .= v1]
    AsyncDeleteBankFeedAccountResponseVariant2 v2 -> object ["type" .= ("variant2" :: Text), "value" .= v2]
