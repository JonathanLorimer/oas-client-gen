{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Inventory3 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.Locations1 (Locations1)

data Inventory3 = Inventory3
  { locations :: Maybe [Locations1]
  , totalCount :: Maybe Double
  }
  deriving (Show, Eq)

instance FromJSON Inventory3 where
  parseJSON = withObject "Inventory3" $ \obj -> do
    locations <- obj .: "locations"
    totalCount <- obj .: "total_count"
    pure $ Inventory3{..}

instance ToJSON Inventory3 where
  toJSON Inventory3{..} =
    object [
      "locations" .= locations,
      "total_count" .= totalCount
    ]
