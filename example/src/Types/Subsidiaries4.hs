{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Subsidiaries4 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Subsidiaries4 = Subsidiaries4
  { id :: Text
  , primary :: Bool
  , status :: Text
  }
  deriving (Show, Eq)

instance FromJSON Subsidiaries4 where
  parseJSON = withObject "Subsidiaries4" $ \obj -> do
    id <- obj .: "id"
    primary <- obj .: "primary"
    status <- obj .: "status"
    pure $ Subsidiaries4{..}

instance ToJSON Subsidiaries4 where
  toJSON Subsidiaries4{..} =
    object [
      "id" .= id,
      "primary" .= primary,
      "status" .= status
    ]
