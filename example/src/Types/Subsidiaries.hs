{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Subsidiaries where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Subsidiaries = Subsidiaries
  { id :: Text
  , status :: Text
  }
  deriving (Show, Eq)

instance FromJSON Subsidiaries where
  parseJSON = withObject "Subsidiaries" $ \obj -> do
    id <- obj .: "id"
    status <- obj .: "status"
    pure $ Subsidiaries{..}

instance ToJSON Subsidiaries where
  toJSON Subsidiaries{..} =
    object [
      "id" .= id,
      "status" .= status
    ]
