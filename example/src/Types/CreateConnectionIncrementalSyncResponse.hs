{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateConnectionIncrementalSyncResponse where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data CreateConnectionIncrementalSyncResponse = CreateConnectionIncrementalSyncResponse
  { success :: Bool
  }
  deriving (Show, Eq)

instance FromJSON CreateConnectionIncrementalSyncResponse where
  parseJSON = withObject "CreateConnectionIncrementalSyncResponse" $ \obj -> do
    success <- obj .: "success"
    pure $ CreateConnectionIncrementalSyncResponse{..}

instance ToJSON CreateConnectionIncrementalSyncResponse where
  toJSON CreateConnectionIncrementalSyncResponse{..} =
    object [
      "success" .= success
    ]
