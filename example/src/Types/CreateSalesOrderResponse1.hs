{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateSalesOrderResponse1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AsyncResponse37 (AsyncResponse37)

data CreateSalesOrderResponse1 = CreateSalesOrderResponse1
  { asyncResponse :: AsyncResponse37
  }
  deriving (Show, Eq)

instance FromJSON CreateSalesOrderResponse1 where
  parseJSON = withObject "CreateSalesOrderResponse1" $ \obj -> do
    asyncResponse <- obj .: "async_response"
    pure $ CreateSalesOrderResponse1{..}

instance ToJSON CreateSalesOrderResponse1 where
  toJSON CreateSalesOrderResponse1{..} =
    object [
      "async_response" .= asyncResponse
    ]
