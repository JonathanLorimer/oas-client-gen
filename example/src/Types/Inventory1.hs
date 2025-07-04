{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Inventory1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Inventory1 = Inventory1
  { locationId :: Text
  , totalCount :: Double
  }
  deriving (Show, Eq)

instance FromJSON Inventory1 where
  parseJSON = withObject "Inventory1" $ \obj -> do
    locationId <- obj .: "location_id"
    totalCount <- obj .: "total_count"
    pure $ Inventory1{..}

instance ToJSON Inventory1 where
  toJSON Inventory1{..} =
    object [
      "location_id" .= locationId,
      "total_count" .= totalCount
    ]
