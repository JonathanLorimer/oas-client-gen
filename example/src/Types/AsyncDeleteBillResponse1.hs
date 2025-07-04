{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AsyncDeleteBillResponse1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AsyncResponse13 (AsyncResponse13)

data AsyncDeleteBillResponse1 = AsyncDeleteBillResponse1
  { asyncResponse :: AsyncResponse13
  }
  deriving (Show, Eq)

instance FromJSON AsyncDeleteBillResponse1 where
  parseJSON = withObject "AsyncDeleteBillResponse1" $ \obj -> do
    asyncResponse <- obj .: "async_response"
    pure $ AsyncDeleteBillResponse1{..}

instance ToJSON AsyncDeleteBillResponse1 where
  toJSON AsyncDeleteBillResponse1{..} =
    object [
      "async_response" .= asyncResponse
    ]
