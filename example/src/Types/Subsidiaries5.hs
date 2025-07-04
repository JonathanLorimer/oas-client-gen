{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Subsidiaries5 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Subsidiaries5 = Subsidiaries5
  { id :: Text
  , primary :: Bool
  }
  deriving (Show, Eq)

instance FromJSON Subsidiaries5 where
  parseJSON = withObject "Subsidiaries5" $ \obj -> do
    id <- obj .: "id"
    primary <- obj .: "primary"
    pure $ Subsidiaries5{..}

instance ToJSON Subsidiaries5 where
  toJSON Subsidiaries5{..} =
    object [
      "id" .= id,
      "primary" .= primary
    ]
