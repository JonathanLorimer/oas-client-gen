{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateConnectionBackfillResponse where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data CreateConnectionBackfillResponse = CreateConnectionBackfillResponse
  { success :: Bool
  }
  deriving (Show, Eq)

instance FromJSON CreateConnectionBackfillResponse where
  parseJSON = withObject "CreateConnectionBackfillResponse" $ \obj -> do
    success <- obj .: "success"
    pure $ CreateConnectionBackfillResponse{..}

instance ToJSON CreateConnectionBackfillResponse where
  toJSON CreateConnectionBackfillResponse{..} =
    object [
      "success" .= success
    ]
