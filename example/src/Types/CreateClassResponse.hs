{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateClassResponse where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AsyncResponse15 (AsyncResponse15)
import Types.CreateClassResponse1 (CreateClassResponse1)

data CreateClassResponse
  = CreateClassResponseVariant1 CreateClassResponse
  | CreateClassResponseVariant2 CreateClassResponse1
  deriving (Show, Eq)

instance FromJSON CreateClassResponse where
  parseJSON value = asum
    [ CreateClassResponseVariant1 <$> parseJSON value
    , CreateClassResponseVariant2 <$> parseJSON value
    ]

instance ToJSON CreateClassResponse where
  toJSON = \case
    CreateClassResponseVariant1 v1 -> object ["type" .= ("variant1" :: Text), "value" .= v1]
    CreateClassResponseVariant2 v2 -> object ["type" .= ("variant2" :: Text), "value" .= v2]
