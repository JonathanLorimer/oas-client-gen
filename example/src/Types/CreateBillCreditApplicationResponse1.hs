{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateBillCreditApplicationResponse1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AsyncResponse8 (AsyncResponse8)

data CreateBillCreditApplicationResponse1 = CreateBillCreditApplicationResponse1
  { asyncResponse :: AsyncResponse8
  }
  deriving (Show, Eq)

instance FromJSON CreateBillCreditApplicationResponse1 where
  parseJSON = withObject "CreateBillCreditApplicationResponse1" $ \obj -> do
    asyncResponse <- obj .: "async_response"
    pure $ CreateBillCreditApplicationResponse1{..}

instance ToJSON CreateBillCreditApplicationResponse1 where
  toJSON CreateBillCreditApplicationResponse1{..} =
    object [
      "async_response" .= asyncResponse
    ]
