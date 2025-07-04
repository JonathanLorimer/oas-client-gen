{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreatePurchaseOrder20230207Response1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AsyncResponse35 (AsyncResponse35)

data CreatePurchaseOrder20230207Response1 = CreatePurchaseOrder20230207Response1
  { asyncResponse :: AsyncResponse35
  }
  deriving (Show, Eq)

instance FromJSON CreatePurchaseOrder20230207Response1 where
  parseJSON = withObject "CreatePurchaseOrder20230207Response1" $ \obj -> do
    asyncResponse <- obj .: "async_response"
    pure $ CreatePurchaseOrder20230207Response1{..}

instance ToJSON CreatePurchaseOrder20230207Response1 where
  toJSON CreatePurchaseOrder20230207Response1{..} =
    object [
      "async_response" .= asyncResponse
    ]
