{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AsyncDeleteExpenseResponse where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AsyncDeleteExpenseResponse1 (AsyncDeleteExpenseResponse1)
import Types.AsyncResponse21 (AsyncResponse21)

data AsyncDeleteExpenseResponse
  = AsyncDeleteExpenseResponseVariant1 AsyncDeleteExpenseResponse
  | AsyncDeleteExpenseResponseVariant2 AsyncDeleteExpenseResponse1
  deriving (Show, Eq)

instance FromJSON AsyncDeleteExpenseResponse where
  parseJSON value = asum
    [ AsyncDeleteExpenseResponseVariant1 <$> parseJSON value
    , AsyncDeleteExpenseResponseVariant2 <$> parseJSON value
    ]

instance ToJSON AsyncDeleteExpenseResponse where
  toJSON = \case
    AsyncDeleteExpenseResponseVariant1 v1 -> object ["type" .= ("variant1" :: Text), "value" .= v1]
    AsyncDeleteExpenseResponseVariant2 v2 -> object ["type" .= ("variant2" :: Text), "value" .= v2]
