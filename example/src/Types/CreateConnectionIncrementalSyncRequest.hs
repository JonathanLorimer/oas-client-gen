{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateConnectionIncrementalSyncRequest where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data CreateConnectionIncrementalSyncRequest = CreateConnectionIncrementalSyncRequest
  { objectTypes :: Text
  }
  deriving (Show, Eq)

instance FromJSON CreateConnectionIncrementalSyncRequest where
  parseJSON = withObject "CreateConnectionIncrementalSyncRequest" $ \obj -> do
    objectTypes <- obj .: "object_types"
    pure $ CreateConnectionIncrementalSyncRequest{..}

instance ToJSON CreateConnectionIncrementalSyncRequest where
  toJSON CreateConnectionIncrementalSyncRequest{..} =
    object [
      "object_types" .= objectTypes
    ]
