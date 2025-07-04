{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ListListCashFlowStatementResponseResponse1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AsyncResponse14 (AsyncResponse14)

data ListListCashFlowStatementResponseResponse1 = ListListCashFlowStatementResponseResponse1
  { asyncResponse :: AsyncResponse14
  }
  deriving (Show, Eq)

instance FromJSON ListListCashFlowStatementResponseResponse1 where
  parseJSON = withObject "ListListCashFlowStatementResponseResponse1" $ \obj -> do
    asyncResponse <- obj .: "async_response"
    pure $ ListListCashFlowStatementResponseResponse1{..}

instance ToJSON ListListCashFlowStatementResponseResponse1 where
  toJSON ListListCashFlowStatementResponseResponse1{..} =
    object [
      "async_response" .= asyncResponse
    ]
