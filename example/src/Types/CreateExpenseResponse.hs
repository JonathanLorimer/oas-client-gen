{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateExpenseResponse where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AsyncResponse20 (AsyncResponse20)
import Types.CreateExpenseResponse1 (CreateExpenseResponse1)

data CreateExpenseResponse
  = CreateExpenseResponseVariant1 CreateExpenseResponse
  | CreateExpenseResponseVariant2 CreateExpenseResponse1
  deriving (Show, Eq)

instance FromJSON CreateExpenseResponse where
  parseJSON value = asum
    [ CreateExpenseResponseVariant1 <$> parseJSON value
    , CreateExpenseResponseVariant2 <$> parseJSON value
    ]

instance ToJSON CreateExpenseResponse where
  toJSON = \case
    CreateExpenseResponseVariant1 v1 -> object ["type" .= ("variant1" :: Text), "value" .= v1]
    CreateExpenseResponseVariant2 v2 -> object ["type" .= ("variant2" :: Text), "value" .= v2]
