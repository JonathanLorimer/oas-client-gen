{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AsyncDeletePaymentTermResponse1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AsyncResponse34 (AsyncResponse34)

data AsyncDeletePaymentTermResponse1 = AsyncDeletePaymentTermResponse1
  { asyncResponse :: AsyncResponse34
  }
  deriving (Show, Eq)

instance FromJSON AsyncDeletePaymentTermResponse1 where
  parseJSON = withObject "AsyncDeletePaymentTermResponse1" $ \obj -> do
    asyncResponse <- obj .: "async_response"
    pure $ AsyncDeletePaymentTermResponse1{..}

instance ToJSON AsyncDeletePaymentTermResponse1 where
  toJSON AsyncDeletePaymentTermResponse1{..} =
    object [
      "async_response" .= asyncResponse
    ]
