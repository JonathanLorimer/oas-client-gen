{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AsyncDeletePurchaseOrderResponseResponse1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AsyncResponse36 (AsyncResponse36)

data AsyncDeletePurchaseOrderResponseResponse1 = AsyncDeletePurchaseOrderResponseResponse1
  { asyncResponse :: AsyncResponse36
  }
  deriving (Show, Eq)

instance FromJSON AsyncDeletePurchaseOrderResponseResponse1 where
  parseJSON = withObject "AsyncDeletePurchaseOrderResponseResponse1" $ \obj -> do
    asyncResponse <- obj .: "async_response"
    pure $ AsyncDeletePurchaseOrderResponseResponse1{..}

instance ToJSON AsyncDeletePurchaseOrderResponseResponse1 where
  toJSON AsyncDeletePurchaseOrderResponseResponse1{..} =
    object [
      "async_response" .= asyncResponse
    ]
