{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AdditionalFields10 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data AdditionalFields10 = AdditionalFields10
  { taskId :: Text
  }
  deriving (Show, Eq)

instance FromJSON AdditionalFields10 where
  parseJSON = withObject "AdditionalFields10" $ \obj -> do
    taskId <- obj .: "task_id"
    pure $ AdditionalFields10{..}

instance ToJSON AdditionalFields10 where
  toJSON AdditionalFields10{..} =
    object [
      "task_id" .= taskId
    ]
