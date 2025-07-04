{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateDepartmentResponse where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AsyncResponse19 (AsyncResponse19)
import Types.CreateDepartmentResponse1 (CreateDepartmentResponse1)

data CreateDepartmentResponse
  = CreateDepartmentResponseVariant1 CreateDepartmentResponse
  | CreateDepartmentResponseVariant2 CreateDepartmentResponse1
  deriving (Show, Eq)

instance FromJSON CreateDepartmentResponse where
  parseJSON value = asum
    [ CreateDepartmentResponseVariant1 <$> parseJSON value
    , CreateDepartmentResponseVariant2 <$> parseJSON value
    ]

instance ToJSON CreateDepartmentResponse where
  toJSON = \case
    CreateDepartmentResponseVariant1 v1 -> object ["type" .= ("variant1" :: Text), "value" .= v1]
    CreateDepartmentResponseVariant2 v2 -> object ["type" .= ("variant2" :: Text), "value" .= v2]
