{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.LinkedBills where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data LinkedBills = LinkedBills
  { allocatedAmount :: Text
  , id :: Text
  }
  deriving (Show, Eq)

instance FromJSON LinkedBills where
  parseJSON = withObject "LinkedBills" $ \obj -> do
    allocatedAmount <- obj .: "allocated_amount"
    id <- obj .: "id"
    pure $ LinkedBills{..}

instance ToJSON LinkedBills where
  toJSON LinkedBills{..} =
    object [
      "allocated_amount" .= allocatedAmount,
      "id" .= id
    ]
