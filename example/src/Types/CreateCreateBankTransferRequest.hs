{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateCreateBankTransferRequest where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AdditionalFields3 (AdditionalFields3)
import Types.CreateBankTransfer (CreateBankTransfer)

data CreateCreateBankTransferRequest = CreateCreateBankTransferRequest
  { bankTransfer :: CreateBankTransfer
  , responseMode :: Text
  }
  deriving (Show, Eq)

instance FromJSON CreateCreateBankTransferRequest where
  parseJSON = withObject "CreateCreateBankTransferRequest" $ \obj -> do
    bankTransfer <- obj .: "bank_transfer"
    responseMode <- obj .: "response_mode"
    pure $ CreateCreateBankTransferRequest{..}

instance ToJSON CreateCreateBankTransferRequest where
  toJSON CreateCreateBankTransferRequest{..} =
    object [
      "bank_transfer" .= bankTransfer,
      "response_mode" .= responseMode
    ]
