{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Connection where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Connection = Connection
  { id :: Text
  , orgId :: Text
  , platform :: Text
  }
  deriving (Show, Eq)

instance FromJSON Connection where
  parseJSON = withObject "Connection" $ \obj -> do
    id <- obj .: "id"
    orgId <- obj .: "orgId"
    platform <- obj .: "platform"
    pure $ Connection{..}

instance ToJSON Connection where
  toJSON Connection{..} =
    object [
      "id" .= id,
      "orgId" .= orgId,
      "platform" .= platform
    ]
