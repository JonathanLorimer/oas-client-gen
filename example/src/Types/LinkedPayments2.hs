{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.LinkedPayments2 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data LinkedPayments2 = LinkedPayments2
  { allocatedAmount :: Double
  , allocatedDate :: Text
  , id :: Text
  }
  deriving (Show, Eq)

instance FromJSON LinkedPayments2 where
  parseJSON = withObject "LinkedPayments2" $ \obj -> do
    allocatedAmount <- obj .: "allocated_amount"
    allocatedDate <- obj .: "allocated_date"
    id <- obj .: "id"
    pure $ LinkedPayments2{..}

instance ToJSON LinkedPayments2 where
  toJSON LinkedPayments2{..} =
    object [
      "allocated_amount" .= allocatedAmount,
      "allocated_date" .= allocatedDate,
      "id" .= id
    ]
