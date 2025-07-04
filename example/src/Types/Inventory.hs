{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Inventory where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.Locations (Locations)

data Inventory = Inventory
  { locations :: Maybe [Locations]
  , totalCount :: Maybe Double
  }
  deriving (Show, Eq)

instance FromJSON Inventory where
  parseJSON = withObject "Inventory" $ \obj -> do
    locations <- obj .: "locations"
    totalCount <- obj .: "total_count"
    pure $ Inventory{..}

instance ToJSON Inventory where
  toJSON Inventory{..} =
    object [
      "locations" .= locations,
      "total_count" .= totalCount
    ]
