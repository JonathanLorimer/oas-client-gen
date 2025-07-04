{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateOrderFulfillmentResponse1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AsyncResponse40 (AsyncResponse40)

data CreateOrderFulfillmentResponse1 = CreateOrderFulfillmentResponse1
  { asyncResponse :: AsyncResponse40
  }
  deriving (Show, Eq)

instance FromJSON CreateOrderFulfillmentResponse1 where
  parseJSON = withObject "CreateOrderFulfillmentResponse1" $ \obj -> do
    asyncResponse <- obj .: "async_response"
    pure $ CreateOrderFulfillmentResponse1{..}

instance ToJSON CreateOrderFulfillmentResponse1 where
  toJSON CreateOrderFulfillmentResponse1{..} =
    object [
      "async_response" .= asyncResponse
    ]
