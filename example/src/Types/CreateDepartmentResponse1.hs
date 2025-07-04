{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateDepartmentResponse1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AsyncResponse19 (AsyncResponse19)

data CreateDepartmentResponse1 = CreateDepartmentResponse1
  { asyncResponse :: AsyncResponse19
  }
  deriving (Show, Eq)

instance FromJSON CreateDepartmentResponse1 where
  parseJSON = withObject "CreateDepartmentResponse1" $ \obj -> do
    asyncResponse <- obj .: "async_response"
    pure $ CreateDepartmentResponse1{..}

instance ToJSON CreateDepartmentResponse1 where
  toJSON CreateDepartmentResponse1{..} =
    object [
      "async_response" .= asyncResponse
    ]
