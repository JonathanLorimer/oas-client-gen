{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AdditionalFields2 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data AdditionalFields2 = AdditionalFields2
  { overrideExisting :: Bool
  , skipAccountLink :: Bool
  }
  deriving (Show, Eq)

instance FromJSON AdditionalFields2 where
  parseJSON = withObject "AdditionalFields2" $ \obj -> do
    overrideExisting <- obj .: "override_existing"
    skipAccountLink <- obj .: "skip_account_link"
    pure $ AdditionalFields2{..}

instance ToJSON AdditionalFields2 where
  toJSON AdditionalFields2{..} =
    object [
      "override_existing" .= overrideExisting,
      "skip_account_link" .= skipAccountLink
    ]
