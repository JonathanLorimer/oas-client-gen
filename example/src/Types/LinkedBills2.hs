{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.LinkedBills2 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data LinkedBills2 = LinkedBills2
  { allocatedAmount :: Double
  , allocatedDate :: Text
  , id :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON LinkedBills2 where
  parseJSON = withObject "LinkedBills2" $ \obj -> do
    allocatedAmount <- obj .: "allocated_amount"
    allocatedDate <- obj .: "allocated_date"
    id <- obj .: "id"
    pure $ LinkedBills2{..}

instance ToJSON LinkedBills2 where
  toJSON LinkedBills2{..} =
    object [
      "allocated_amount" .= allocatedAmount,
      "allocated_date" .= allocatedDate,
      "id" .= id
    ]
