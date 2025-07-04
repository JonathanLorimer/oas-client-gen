{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ListListIncomeStatementResponseResponse1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AsyncResponse22 (AsyncResponse22)

data ListListIncomeStatementResponseResponse1 = ListListIncomeStatementResponseResponse1
  { asyncResponse :: AsyncResponse22
  }
  deriving (Show, Eq)

instance FromJSON ListListIncomeStatementResponseResponse1 where
  parseJSON = withObject "ListListIncomeStatementResponseResponse1" $ \obj -> do
    asyncResponse <- obj .: "async_response"
    pure $ ListListIncomeStatementResponseResponse1{..}

instance ToJSON ListListIncomeStatementResponseResponse1 where
  toJSON ListListIncomeStatementResponseResponse1{..} =
    object [
      "async_response" .= asyncResponse
    ]
