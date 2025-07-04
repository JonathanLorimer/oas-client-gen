{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AdditionalFields12 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data AdditionalFields12 = AdditionalFields12
  { taskId :: Text
  }
  deriving (Show, Eq)

instance FromJSON AdditionalFields12 where
  parseJSON = withObject "AdditionalFields12" $ \obj -> do
    taskId <- obj .: "task_id"
    pure $ AdditionalFields12{..}

instance ToJSON AdditionalFields12 where
  toJSON AdditionalFields12{..} =
    object [
      "task_id" .= taskId
    ]
