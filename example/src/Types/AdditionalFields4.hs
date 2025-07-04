{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AdditionalFields4 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data AdditionalFields4 = AdditionalFields4
  { accountId :: Text
  }
  deriving (Show, Eq)

instance FromJSON AdditionalFields4 where
  parseJSON = withObject "AdditionalFields4" $ \obj -> do
    accountId <- obj .: "account_id"
    pure $ AdditionalFields4{..}

instance ToJSON AdditionalFields4 where
  toJSON AdditionalFields4{..} =
    object [
      "account_id" .= accountId
    ]
