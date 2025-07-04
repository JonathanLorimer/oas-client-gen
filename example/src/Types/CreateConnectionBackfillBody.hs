{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateConnectionBackfillBody where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data CreateConnectionBackfillBody = CreateConnectionBackfillBody
  { endDate :: Text
  , includeWebhooks :: Bool
  , objectTypes :: Text
  , remarks :: Text
  , startDate :: Text
  }
  deriving (Show, Eq)

instance FromJSON CreateConnectionBackfillBody where
  parseJSON = withObject "CreateConnectionBackfillBody" $ \obj -> do
    endDate <- obj .: "end_date"
    includeWebhooks <- obj .: "include_webhooks"
    objectTypes <- obj .: "object_types"
    remarks <- obj .: "remarks"
    startDate <- obj .: "start_date"
    pure $ CreateConnectionBackfillBody{..}

instance ToJSON CreateConnectionBackfillBody where
  toJSON CreateConnectionBackfillBody{..} =
    object [
      "end_date" .= endDate,
      "include_webhooks" .= includeWebhooks,
      "object_types" .= objectTypes,
      "remarks" .= remarks,
      "start_date" .= startDate
    ]
