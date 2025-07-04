{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateExpenseResponse1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AsyncResponse20 (AsyncResponse20)

data CreateExpenseResponse1 = CreateExpenseResponse1
  { asyncResponse :: AsyncResponse20
  }
  deriving (Show, Eq)

instance FromJSON CreateExpenseResponse1 where
  parseJSON = withObject "CreateExpenseResponse1" $ \obj -> do
    asyncResponse <- obj .: "async_response"
    pure $ CreateExpenseResponse1{..}

instance ToJSON CreateExpenseResponse1 where
  toJSON CreateExpenseResponse1{..} =
    object [
      "async_response" .= asyncResponse
    ]
