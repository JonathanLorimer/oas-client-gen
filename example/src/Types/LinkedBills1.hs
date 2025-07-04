{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.LinkedBills1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data LinkedBills1 = LinkedBills1
  { allocatedAmount :: Double
  , allocatedDate :: Text
  , id :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON LinkedBills1 where
  parseJSON = withObject "LinkedBills1" $ \obj -> do
    allocatedAmount <- obj .: "allocated_amount"
    allocatedDate <- obj .: "allocated_date"
    id <- obj .: "id"
    pure $ LinkedBills1{..}

instance ToJSON LinkedBills1 where
  toJSON LinkedBills1{..} =
    object [
      "allocated_amount" .= allocatedAmount,
      "allocated_date" .= allocatedDate,
      "id" .= id
    ]
