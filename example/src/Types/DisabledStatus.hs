{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.DisabledStatus where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data DisabledStatus = DisabledStatus
  { disabledReason :: Maybe Text
  , isDisabled :: Bool
  }
  deriving (Show, Eq)

instance FromJSON DisabledStatus where
  parseJSON = withObject "DisabledStatus" $ \obj -> do
    disabledReason <- obj .: "disabled_reason"
    isDisabled <- obj .: "is_disabled"
    pure $ DisabledStatus{..}

instance ToJSON DisabledStatus where
  toJSON DisabledStatus{..} =
    object [
      "disabled_reason" .= disabledReason,
      "is_disabled" .= isDisabled
    ]
