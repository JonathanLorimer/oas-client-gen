{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Balance where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)


data Balance
  = BalanceVariant1 Balance
  | BalanceVariant2 [Balance]
  deriving (Show, Eq)

instance FromJSON Balance where
  parseJSON value = asum
    [ BalanceVariant1 <$> parseJSON value
    , BalanceVariant2 <$> parseJSON value
    ]

instance ToJSON Balance where
  toJSON = \case
    BalanceVariant1 v1 -> object ["type" .= ("variant1" :: Text), "value" .= v1]
    BalanceVariant2 v2 -> object ["type" .= ("variant2" :: Text), "value" .= v2]
