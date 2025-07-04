{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateBillCreditMemoResponse1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AsyncResponse9 (AsyncResponse9)

data CreateBillCreditMemoResponse1 = CreateBillCreditMemoResponse1
  { asyncResponse :: AsyncResponse9
  }
  deriving (Show, Eq)

instance FromJSON CreateBillCreditMemoResponse1 where
  parseJSON = withObject "CreateBillCreditMemoResponse1" $ \obj -> do
    asyncResponse <- obj .: "async_response"
    pure $ CreateBillCreditMemoResponse1{..}

instance ToJSON CreateBillCreditMemoResponse1 where
  toJSON CreateBillCreditMemoResponse1{..} =
    object [
      "async_response" .= asyncResponse
    ]
