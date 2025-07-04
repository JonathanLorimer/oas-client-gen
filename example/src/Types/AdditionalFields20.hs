{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AdditionalFields20 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.Item6 (Item6)

data AdditionalFields20 = AdditionalFields20
  { billable :: Bool
  , item :: Item6
  , taskId :: Text
  }
  deriving (Show, Eq)

instance FromJSON AdditionalFields20 where
  parseJSON = withObject "AdditionalFields20" $ \obj -> do
    billable <- obj .: "billable"
    item <- obj .: "item"
    taskId <- obj .: "task_id"
    pure $ AdditionalFields20{..}

instance ToJSON AdditionalFields20 where
  toJSON AdditionalFields20{..} =
    object [
      "billable" .= billable,
      "item" .= item,
      "task_id" .= taskId
    ]
