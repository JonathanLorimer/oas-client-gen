{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.LinkedPayments3 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data LinkedPayments3 = LinkedPayments3
  { allocatedAmount :: Double
  , allocatedDate :: Text
  , id :: Text
  , type_ :: Text
  }
  deriving (Show, Eq)

instance FromJSON LinkedPayments3 where
  parseJSON = withObject "LinkedPayments3" $ \obj -> do
    allocatedAmount <- obj .: "allocated_amount"
    allocatedDate <- obj .: "allocated_date"
    id <- obj .: "id"
    type_ <- obj .: "type"
    pure $ LinkedPayments3{..}

instance ToJSON LinkedPayments3 where
  toJSON LinkedPayments3{..} =
    object [
      "allocated_amount" .= allocatedAmount,
      "allocated_date" .= allocatedDate,
      "id" .= id,
      "type" .= type_
    ]
