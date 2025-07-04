{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateCreateAccountRequest where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AdditionalFields (AdditionalFields)
import Types.CreateAccount (CreateAccount)

data CreateCreateAccountRequest = CreateCreateAccountRequest
  { account :: CreateAccount
  , responseMode :: Text
  }
  deriving (Show, Eq)

instance FromJSON CreateCreateAccountRequest where
  parseJSON = withObject "CreateCreateAccountRequest" $ \obj -> do
    account <- obj .: "account"
    responseMode <- obj .: "response_mode"
    pure $ CreateCreateAccountRequest{..}

instance ToJSON CreateCreateAccountRequest where
  toJSON CreateCreateAccountRequest{..} =
    object [
      "account" .= account,
      "response_mode" .= responseMode
    ]
