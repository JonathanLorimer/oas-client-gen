{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateBillResponse where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AsyncResponse12 (AsyncResponse12)
import Types.CreateBillResponse1 (CreateBillResponse1)

data CreateBillResponse
  = CreateBillResponseVariant1 CreateBillResponse
  | CreateBillResponseVariant2 CreateBillResponse1
  deriving (Show, Eq)

instance FromJSON CreateBillResponse where
  parseJSON value = asum
    [ CreateBillResponseVariant1 <$> parseJSON value
    , CreateBillResponseVariant2 <$> parseJSON value
    ]

instance ToJSON CreateBillResponse where
  toJSON = \case
    CreateBillResponseVariant1 v1 -> object ["type" .= ("variant1" :: Text), "value" .= v1]
    CreateBillResponseVariant2 v2 -> object ["type" .= ("variant2" :: Text), "value" .= v2]
