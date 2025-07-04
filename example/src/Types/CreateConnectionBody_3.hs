{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateConnectionBody_3 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.CreateConnectionBody3 (CreateConnectionBody3)
import Types.CreateConnectionBody4 (CreateConnectionBody4)

data CreateConnectionBody_3
  = CreateConnectionBody_3Variant1 CreateConnectionBody3
  | CreateConnectionBody_3Variant2 CreateConnectionBody4
  deriving (Show, Eq)

instance FromJSON CreateConnectionBody_3 where
  parseJSON value = asum
    [ CreateConnectionBody_3Variant1 <$> parseJSON value
    , CreateConnectionBody_3Variant2 <$> parseJSON value
    ]

instance ToJSON CreateConnectionBody_3 where
  toJSON = \case
    CreateConnectionBody_3Variant1 v1 -> object ["type" .= ("variant1" :: Text), "value" .= v1]
    CreateConnectionBody_3Variant2 v2 -> object ["type" .= ("variant2" :: Text), "value" .= v2]
