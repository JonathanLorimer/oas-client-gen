{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Ach where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Ach = Ach
  { accountNumber :: Maybe Text
  , routingNumber :: Maybe Text
  , wireRoutingNumber :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON Ach where
  parseJSON = withObject "Ach" $ \obj -> do
    accountNumber <- obj .: "account_number"
    routingNumber <- obj .: "routing_number"
    wireRoutingNumber <- obj .: "wire_routing_number"
    pure $ Ach{..}

instance ToJSON Ach where
  toJSON Ach{..} =
    object [
      "account_number" .= accountNumber,
      "routing_number" .= routingNumber,
      "wire_routing_number" .= wireRoutingNumber
    ]
