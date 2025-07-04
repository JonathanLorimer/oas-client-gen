{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateConnectionBody where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.CreateConnectionBody1 (CreateConnectionBody1)
import Types.CreateConnectionBody10 (CreateConnectionBody10)
import Types.CreateConnectionBody11 (CreateConnectionBody11)
import Types.CreateConnectionBody12 (CreateConnectionBody12)
import Types.CreateConnectionBody13 (CreateConnectionBody13)
import Types.CreateConnectionBody14 (CreateConnectionBody14)
import Types.CreateConnectionBody15 (CreateConnectionBody15)
import Types.CreateConnectionBody16 (CreateConnectionBody16)
import Types.CreateConnectionBody17 (CreateConnectionBody17)
import Types.CreateConnectionBody2 (CreateConnectionBody2)
import Types.CreateConnectionBody3 (CreateConnectionBody3)
import Types.CreateConnectionBody4 (CreateConnectionBody4)
import Types.CreateConnectionBody5 (CreateConnectionBody5)
import Types.CreateConnectionBody6 (CreateConnectionBody6)
import Types.CreateConnectionBody7 (CreateConnectionBody7)
import Types.CreateConnectionBody8 (CreateConnectionBody8)
import Types.CreateConnectionBody9 (CreateConnectionBody9)
import Types.CreateConnectionBody_1 (CreateConnectionBody_1)
import Types.CreateConnectionBody_3 (CreateConnectionBody_3)

data CreateConnectionBody
  = CreateConnectionBodyVariant1 CreateConnectionBody
  | CreateConnectionBodyVariant2 CreateConnectionBody_1
  deriving (Show, Eq)

instance FromJSON CreateConnectionBody where
  parseJSON value = asum
    [ CreateConnectionBodyVariant1 <$> parseJSON value
    , CreateConnectionBodyVariant2 <$> parseJSON value
    ]

instance ToJSON CreateConnectionBody where
  toJSON = \case
    CreateConnectionBodyVariant1 v1 -> object ["type" .= ("variant1" :: Text), "value" .= v1]
    CreateConnectionBodyVariant2 v2 -> object ["type" .= ("variant2" :: Text), "value" .= v2]
