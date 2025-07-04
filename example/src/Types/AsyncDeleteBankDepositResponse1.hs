{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AsyncDeleteBankDepositResponse1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AsyncResponse3 (AsyncResponse3)

data AsyncDeleteBankDepositResponse1 = AsyncDeleteBankDepositResponse1
  { asyncResponse :: AsyncResponse3
  }
  deriving (Show, Eq)

instance FromJSON AsyncDeleteBankDepositResponse1 where
  parseJSON = withObject "AsyncDeleteBankDepositResponse1" $ \obj -> do
    asyncResponse <- obj .: "async_response"
    pure $ AsyncDeleteBankDepositResponse1{..}

instance ToJSON AsyncDeleteBankDepositResponse1 where
  toJSON AsyncDeleteBankDepositResponse1{..} =
    object [
      "async_response" .= asyncResponse
    ]
