{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Config where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.Entities (Entities)
import Types.Orders (Orders)
import Types.Products (Products)
import Types.Variants (Variants)
import Types.Orders (Orders)
import Types.Products (Products)

data Config = Config
  { entities :: Entities
  , timeFrameInMonths :: Double
  }
  deriving (Show, Eq)

instance FromJSON Config where
  parseJSON = withObject "Config" $ \obj -> do
    entities <- obj .: "entities"
    timeFrameInMonths <- obj .: "timeFrameInMonths"
    pure $ Config{..}

instance ToJSON Config where
  toJSON Config{..} =
    object [
      "entities" .= entities,
      "timeFrameInMonths" .= timeFrameInMonths
    ]
