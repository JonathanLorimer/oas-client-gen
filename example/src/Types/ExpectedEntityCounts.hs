{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ExpectedEntityCounts where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data ExpectedEntityCounts = ExpectedEntityCounts
  { batchNum :: Double
  , count :: Maybe Double
  , entity :: Text
  , isEstimate :: Bool
  }
  deriving (Show, Eq)

instance FromJSON ExpectedEntityCounts where
  parseJSON = withObject "ExpectedEntityCounts" $ \obj -> do
    batchNum <- obj .: "batch_num"
    count <- obj .: "count"
    entity <- obj .: "entity"
    isEstimate <- obj .: "is_estimate"
    pure $ ExpectedEntityCounts{..}

instance ToJSON ExpectedEntityCounts where
  toJSON ExpectedEntityCounts{..} =
    object [
      "batch_num" .= batchNum,
      "count" .= count,
      "entity" .= entity,
      "is_estimate" .= isEstimate
    ]
