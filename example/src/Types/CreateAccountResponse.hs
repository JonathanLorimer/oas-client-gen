{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateAccountResponse where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AsyncResponse (AsyncResponse)
import Types.CreateAccountResponse1 (CreateAccountResponse1)

data CreateAccountResponse
  = CreateAccountResponseVariant1 CreateAccountResponse
  | CreateAccountResponseVariant2 CreateAccountResponse1
  deriving (Show, Eq)

instance FromJSON CreateAccountResponse where
  parseJSON value = asum
    [ CreateAccountResponseVariant1 <$> parseJSON value
    , CreateAccountResponseVariant2 <$> parseJSON value
    ]

instance ToJSON CreateAccountResponse where
  toJSON = \case
    CreateAccountResponseVariant1 v1 -> object ["type" .= ("variant1" :: Text), "value" .= v1]
    CreateAccountResponseVariant2 v2 -> object ["type" .= ("variant2" :: Text), "value" .= v2]
