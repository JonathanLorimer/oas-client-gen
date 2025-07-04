{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AsyncDeleteBankTransferResponse1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AsyncResponse7 (AsyncResponse7)

data AsyncDeleteBankTransferResponse1 = AsyncDeleteBankTransferResponse1
  { asyncResponse :: AsyncResponse7
  }
  deriving (Show, Eq)

instance FromJSON AsyncDeleteBankTransferResponse1 where
  parseJSON = withObject "AsyncDeleteBankTransferResponse1" $ \obj -> do
    asyncResponse <- obj .: "async_response"
    pure $ AsyncDeleteBankTransferResponse1{..}

instance ToJSON AsyncDeleteBankTransferResponse1 where
  toJSON AsyncDeleteBankTransferResponse1{..} =
    object [
      "async_response" .= asyncResponse
    ]
