{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AdditionalFields18 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data AdditionalFields18 = AdditionalFields18
  { billable :: Maybe Bool
  , taskId :: Text
  }
  deriving (Show, Eq)

instance FromJSON AdditionalFields18 where
  parseJSON = withObject "AdditionalFields18" $ \obj -> do
    billable <- obj .: "billable"
    taskId <- obj .: "task_id"
    pure $ AdditionalFields18{..}

instance ToJSON AdditionalFields18 where
  toJSON AdditionalFields18{..} =
    object [
      "billable" .= billable,
      "task_id" .= taskId
    ]
