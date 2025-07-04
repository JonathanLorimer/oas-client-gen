{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.NeedsUpdateStatus where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data NeedsUpdateStatus = NeedsUpdateStatus
  { needsUpdate :: Bool
  }
  deriving (Show, Eq)

instance FromJSON NeedsUpdateStatus where
  parseJSON = withObject "NeedsUpdateStatus" $ \obj -> do
    needsUpdate <- obj .: "needs_update"
    pure $ NeedsUpdateStatus{..}

instance ToJSON NeedsUpdateStatus where
  toJSON NeedsUpdateStatus{..} =
    object [
      "needs_update" .= needsUpdate
    ]
