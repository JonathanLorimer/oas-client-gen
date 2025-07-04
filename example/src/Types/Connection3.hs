{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Connection3 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Connection3 = Connection3
  { id :: Text
  , orgId :: Text
  , platform :: Text
  }
  deriving (Show, Eq)

instance FromJSON Connection3 where
  parseJSON = withObject "Connection3" $ \obj -> do
    id <- obj .: "id"
    orgId <- obj .: "orgId"
    platform <- obj .: "platform"
    pure $ Connection3{..}

instance ToJSON Connection3 where
  toJSON Connection3{..} =
    object [
      "id" .= id,
      "orgId" .= orgId,
      "platform" .= platform
    ]
