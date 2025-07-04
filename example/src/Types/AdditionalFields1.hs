{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AdditionalFields1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data AdditionalFields1 = AdditionalFields1
  { reconciled :: Bool
  }
  deriving (Show, Eq)

instance FromJSON AdditionalFields1 where
  parseJSON = withObject "AdditionalFields1" $ \obj -> do
    reconciled <- obj .: "reconciled"
    pure $ AdditionalFields1{..}

instance ToJSON AdditionalFields1 where
  toJSON AdditionalFields1{..} =
    object [
      "reconciled" .= reconciled
    ]
