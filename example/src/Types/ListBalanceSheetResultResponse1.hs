{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ListBalanceSheetResultResponse1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AsyncResponse1 (AsyncResponse1)

data ListBalanceSheetResultResponse1 = ListBalanceSheetResultResponse1
  { asyncResponse :: AsyncResponse1
  }
  deriving (Show, Eq)

instance FromJSON ListBalanceSheetResultResponse1 where
  parseJSON = withObject "ListBalanceSheetResultResponse1" $ \obj -> do
    asyncResponse <- obj .: "async_response"
    pure $ ListBalanceSheetResultResponse1{..}

instance ToJSON ListBalanceSheetResultResponse1 where
  toJSON ListBalanceSheetResultResponse1{..} =
    object [
      "async_response" .= asyncResponse
    ]
