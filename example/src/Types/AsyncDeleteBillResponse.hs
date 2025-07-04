{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AsyncDeleteBillResponse where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AsyncDeleteBillResponse1 (AsyncDeleteBillResponse1)
import Types.AsyncResponse13 (AsyncResponse13)

data AsyncDeleteBillResponse
  = AsyncDeleteBillResponseVariant1 AsyncDeleteBillResponse
  | AsyncDeleteBillResponseVariant2 AsyncDeleteBillResponse1
  deriving (Show, Eq)

instance FromJSON AsyncDeleteBillResponse where
  parseJSON value = asum
    [ AsyncDeleteBillResponseVariant1 <$> parseJSON value
    , AsyncDeleteBillResponseVariant2 <$> parseJSON value
    ]

instance ToJSON AsyncDeleteBillResponse where
  toJSON = \case
    AsyncDeleteBillResponseVariant1 v1 -> object ["type" .= ("variant1" :: Text), "value" .= v1]
    AsyncDeleteBillResponseVariant2 v2 -> object ["type" .= ("variant2" :: Text), "value" .= v2]
