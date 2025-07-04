{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.LinkedBills3 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data LinkedBills3 = LinkedBills3
  { allocatedAmount :: Double
  , id :: Text
  }
  deriving (Show, Eq)

instance FromJSON LinkedBills3 where
  parseJSON = withObject "LinkedBills3" $ \obj -> do
    allocatedAmount <- obj .: "allocated_amount"
    id <- obj .: "id"
    pure $ LinkedBills3{..}

instance ToJSON LinkedBills3 where
  toJSON LinkedBills3{..} =
    object [
      "allocated_amount" .= allocatedAmount,
      "id" .= id
    ]
