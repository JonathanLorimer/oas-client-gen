{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateBillResponse1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AsyncResponse12 (AsyncResponse12)

data CreateBillResponse1 = CreateBillResponse1
  { asyncResponse :: AsyncResponse12
  }
  deriving (Show, Eq)

instance FromJSON CreateBillResponse1 where
  parseJSON = withObject "CreateBillResponse1" $ \obj -> do
    asyncResponse <- obj .: "async_response"
    pure $ CreateBillResponse1{..}

instance ToJSON CreateBillResponse1 where
  toJSON CreateBillResponse1{..} =
    object [
      "async_response" .= asyncResponse
    ]
