{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Subsidiaries1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Subsidiaries1 = Subsidiaries1
  { id :: Text
  }
  deriving (Show, Eq)

instance FromJSON Subsidiaries1 where
  parseJSON = withObject "Subsidiaries1" $ \obj -> do
    id <- obj .: "id"
    pure $ Subsidiaries1{..}

instance ToJSON Subsidiaries1 where
  toJSON Subsidiaries1{..} =
    object [
      "id" .= id
    ]
