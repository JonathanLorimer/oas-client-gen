{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateCreateBankDepositRequest where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AdditionalFields1 (AdditionalFields1)
import Types.CreateBankDeposit (CreateBankDeposit)
import Types.LineItems1 (LineItems1)
import Types.LinkedPayments1 (LinkedPayments1)

data CreateCreateBankDepositRequest = CreateCreateBankDepositRequest
  { bankDeposit :: CreateBankDeposit
  , responseMode :: Text
  }
  deriving (Show, Eq)

instance FromJSON CreateCreateBankDepositRequest where
  parseJSON = withObject "CreateCreateBankDepositRequest" $ \obj -> do
    bankDeposit <- obj .: "bank_deposit"
    responseMode <- obj .: "response_mode"
    pure $ CreateCreateBankDepositRequest{..}

instance ToJSON CreateCreateBankDepositRequest where
  toJSON CreateCreateBankDepositRequest{..} =
    object [
      "bank_deposit" .= bankDeposit,
      "response_mode" .= responseMode
    ]
