{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Batches where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.Config (Config)
import Types.Entities (Entities)
import Types.Orders (Orders)
import Types.Products (Products)
import Types.Variants (Variants)
import Types.Orders (Orders)
import Types.Products (Products)

data Batches = Batches
  { batchNum :: Double
  , config :: Maybe Config
  , progressInfo :: Map Text Value
  }
  deriving (Show, Eq)

instance FromJSON Batches where
  parseJSON = withObject "Batches" $ \obj -> do
    batchNum <- obj .: "batch_num"
    config <- obj .: "config"
    progressInfo <- obj .: "progress_info"
    pure $ Batches{..}

instance ToJSON Batches where
  toJSON Batches{..} =
    object [
      "batch_num" .= batchNum,
      "config" .= config,
      "progress_info" .= progressInfo
    ]
