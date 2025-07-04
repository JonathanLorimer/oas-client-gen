{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateBankTransferResponse1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AsyncResponse6 (AsyncResponse6)

data CreateBankTransferResponse1 = CreateBankTransferResponse1
  { asyncResponse :: AsyncResponse6
  }
  deriving (Show, Eq)

instance FromJSON CreateBankTransferResponse1 where
  parseJSON = withObject "CreateBankTransferResponse1" $ \obj -> do
    asyncResponse <- obj .: "async_response"
    pure $ CreateBankTransferResponse1{..}

instance ToJSON CreateBankTransferResponse1 where
  toJSON CreateBankTransferResponse1{..} =
    object [
      "async_response" .= asyncResponse
    ]
