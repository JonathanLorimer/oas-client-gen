{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AdditionalFields5 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data AdditionalFields5 = AdditionalFields5
  { taskId :: Text
  }
  deriving (Show, Eq)

instance FromJSON AdditionalFields5 where
  parseJSON = withObject "AdditionalFields5" $ \obj -> do
    taskId <- obj .: "task_id"
    pure $ AdditionalFields5{..}

instance ToJSON AdditionalFields5 where
  toJSON AdditionalFields5{..} =
    object [
      "task_id" .= taskId
    ]
