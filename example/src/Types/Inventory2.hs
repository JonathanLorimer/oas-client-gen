{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Inventory2 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Inventory2 = Inventory2
  { locationId :: Text
  , totalCount :: Double
  }
  deriving (Show, Eq)

instance FromJSON Inventory2 where
  parseJSON = withObject "Inventory2" $ \obj -> do
    locationId <- obj .: "location_id"
    totalCount <- obj .: "total_count"
    pure $ Inventory2{..}

instance ToJSON Inventory2 where
  toJSON Inventory2{..} =
    object [
      "location_id" .= locationId,
      "total_count" .= totalCount
    ]
