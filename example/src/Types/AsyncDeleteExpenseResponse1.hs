{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AsyncDeleteExpenseResponse1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AsyncResponse21 (AsyncResponse21)

data AsyncDeleteExpenseResponse1 = AsyncDeleteExpenseResponse1
  { asyncResponse :: AsyncResponse21
  }
  deriving (Show, Eq)

instance FromJSON AsyncDeleteExpenseResponse1 where
  parseJSON = withObject "AsyncDeleteExpenseResponse1" $ \obj -> do
    asyncResponse <- obj .: "async_response"
    pure $ AsyncDeleteExpenseResponse1{..}

instance ToJSON AsyncDeleteExpenseResponse1 where
  toJSON AsyncDeleteExpenseResponse1{..} =
    object [
      "async_response" .= asyncResponse
    ]
