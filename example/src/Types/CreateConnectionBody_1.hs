{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateConnectionBody_1 where

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
import Types.CreateConnectionBody_3 (CreateConnectionBody_3)

data CreateConnectionBody_1
  = CreateConnectionBody_1Variant1 CreateConnectionBody1
  | CreateConnectionBody_1Variant2 CreateConnectionBody2
  | CreateConnectionBody_1Variant3 CreateConnectionBody_3
  | CreateConnectionBody_1Variant4 CreateConnectionBody5
  | CreateConnectionBody_1Variant5 CreateConnectionBody6
  | CreateConnectionBody_1Variant6 CreateConnectionBody7
  | CreateConnectionBody_1Variant7 CreateConnectionBody8
  | CreateConnectionBody_1Variant8 CreateConnectionBody9
  | CreateConnectionBody_1Variant9 CreateConnectionBody10
  | CreateConnectionBody_1Variant10 CreateConnectionBody11
  | CreateConnectionBody_1Variant11 CreateConnectionBody12
  | CreateConnectionBody_1Variant12 CreateConnectionBody13
  | CreateConnectionBody_1Variant13 CreateConnectionBody14
  | CreateConnectionBody_1Variant14 CreateConnectionBody15
  | CreateConnectionBody_1Variant15 CreateConnectionBody16
  | CreateConnectionBody_1Variant16 CreateConnectionBody17
  deriving (Show, Eq)

instance FromJSON CreateConnectionBody_1 where
  parseJSON value = asum
    [ CreateConnectionBody_1Variant1 <$> parseJSON value
    , CreateConnectionBody_1Variant2 <$> parseJSON value
    , CreateConnectionBody_1Variant3 <$> parseJSON value
    , CreateConnectionBody_1Variant4 <$> parseJSON value
    , CreateConnectionBody_1Variant5 <$> parseJSON value
    , CreateConnectionBody_1Variant6 <$> parseJSON value
    , CreateConnectionBody_1Variant7 <$> parseJSON value
    , CreateConnectionBody_1Variant8 <$> parseJSON value
    , CreateConnectionBody_1Variant9 <$> parseJSON value
    , CreateConnectionBody_1Variant10 <$> parseJSON value
    , CreateConnectionBody_1Variant11 <$> parseJSON value
    , CreateConnectionBody_1Variant12 <$> parseJSON value
    , CreateConnectionBody_1Variant13 <$> parseJSON value
    , CreateConnectionBody_1Variant14 <$> parseJSON value
    , CreateConnectionBody_1Variant15 <$> parseJSON value
    , CreateConnectionBody_1Variant16 <$> parseJSON value
    ]

instance ToJSON CreateConnectionBody_1 where
  toJSON = \case
    CreateConnectionBody_1Variant1 v1 -> object ["type" .= ("variant1" :: Text), "value" .= v1]
    CreateConnectionBody_1Variant2 v2 -> object ["type" .= ("variant2" :: Text), "value" .= v2]
    CreateConnectionBody_1Variant3 v3 -> object ["type" .= ("variant3" :: Text), "value" .= v3]
    CreateConnectionBody_1Variant4 v4 -> object ["type" .= ("variant4" :: Text), "value" .= v4]
    CreateConnectionBody_1Variant5 v5 -> object ["type" .= ("variant5" :: Text), "value" .= v5]
    CreateConnectionBody_1Variant6 v6 -> object ["type" .= ("variant6" :: Text), "value" .= v6]
    CreateConnectionBody_1Variant7 v7 -> object ["type" .= ("variant7" :: Text), "value" .= v7]
    CreateConnectionBody_1Variant8 v8 -> object ["type" .= ("variant8" :: Text), "value" .= v8]
    CreateConnectionBody_1Variant9 v9 -> object ["type" .= ("variant9" :: Text), "value" .= v9]
    CreateConnectionBody_1Variant10 v10 -> object ["type" .= ("variant10" :: Text), "value" .= v10]
    CreateConnectionBody_1Variant11 v11 -> object ["type" .= ("variant11" :: Text), "value" .= v11]
    CreateConnectionBody_1Variant12 v12 -> object ["type" .= ("variant12" :: Text), "value" .= v12]
    CreateConnectionBody_1Variant13 v13 -> object ["type" .= ("variant13" :: Text), "value" .= v13]
    CreateConnectionBody_1Variant14 v14 -> object ["type" .= ("variant14" :: Text), "value" .= v14]
    CreateConnectionBody_1Variant15 v15 -> object ["type" .= ("variant15" :: Text), "value" .= v15]
    CreateConnectionBody_1Variant16 v16 -> object ["type" .= ("variant16" :: Text), "value" .= v16]
