{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateCreateBankFeedAccountRequest where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AdditionalFields2 (AdditionalFields2)
import Types.CreateBankFeedAccount (CreateBankFeedAccount)

data CreateCreateBankFeedAccountRequest = CreateCreateBankFeedAccountRequest
  { bankFeedAccount :: CreateBankFeedAccount
  , responseMode :: Text
  }
  deriving (Show, Eq)

instance FromJSON CreateCreateBankFeedAccountRequest where
  parseJSON = withObject "CreateCreateBankFeedAccountRequest" $ \obj -> do
    bankFeedAccount <- obj .: "bank_feed_account"
    responseMode <- obj .: "response_mode"
    pure $ CreateCreateBankFeedAccountRequest{..}

instance ToJSON CreateCreateBankFeedAccountRequest where
  toJSON CreateCreateBankFeedAccountRequest{..} =
    object [
      "bank_feed_account" .= bankFeedAccount,
      "response_mode" .= responseMode
    ]
