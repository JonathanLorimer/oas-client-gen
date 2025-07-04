{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateBankDepositResponse1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AsyncResponse2 (AsyncResponse2)

data CreateBankDepositResponse1 = CreateBankDepositResponse1
  { asyncResponse :: AsyncResponse2
  }
  deriving (Show, Eq)

instance FromJSON CreateBankDepositResponse1 where
  parseJSON = withObject "CreateBankDepositResponse1" $ \obj -> do
    asyncResponse <- obj .: "async_response"
    pure $ CreateBankDepositResponse1{..}

instance ToJSON CreateBankDepositResponse1 where
  toJSON CreateBankDepositResponse1{..} =
    object [
      "async_response" .= asyncResponse
    ]
