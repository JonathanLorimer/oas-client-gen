{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.DeleteConnectionResponse where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data DeleteConnectionResponse = DeleteConnectionResponse
  { success :: Bool
  }
  deriving (Show, Eq)

instance FromJSON DeleteConnectionResponse where
  parseJSON = withObject "DeleteConnectionResponse" $ \obj -> do
    success <- obj .: "success"
    pure $ DeleteConnectionResponse{..}

instance ToJSON DeleteConnectionResponse where
  toJSON DeleteConnectionResponse{..} =
    object [
      "success" .= success
    ]
