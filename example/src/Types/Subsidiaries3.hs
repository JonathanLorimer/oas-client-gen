{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Subsidiaries3 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Subsidiaries3 = Subsidiaries3
  { id :: Text
  }
  deriving (Show, Eq)

instance FromJSON Subsidiaries3 where
  parseJSON = withObject "Subsidiaries3" $ \obj -> do
    id <- obj .: "id"
    pure $ Subsidiaries3{..}

instance ToJSON Subsidiaries3 where
  toJSON Subsidiaries3{..} =
    object [
      "id" .= id
    ]
