{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Balance1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Balance1 = Balance1
  { available :: Maybe Double
  , currencyCode :: Maybe Text
  , current :: Maybe Double
  }
  deriving (Show, Eq)

instance FromJSON Balance1 where
  parseJSON = withObject "Balance1" $ \obj -> do
    available <- obj .: "available"
    currencyCode <- obj .: "currency_code"
    current <- obj .: "current"
    pure $ Balance1{..}

instance ToJSON Balance1 where
  toJSON Balance1{..} =
    object [
      "available" .= available,
      "currency_code" .= currencyCode,
      "current" .= current
    ]
