{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Item2 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Item2 = Item2
  { id :: Maybe Text
  , quantity :: Maybe Double
  , unitAmount :: Maybe Double
  }
  deriving (Show, Eq)

instance FromJSON Item2 where
  parseJSON = withObject "Item2" $ \obj -> do
    id <- obj .: "id"
    quantity <- obj .: "quantity"
    unitAmount <- obj .: "unit_amount"
    pure $ Item2{..}

instance ToJSON Item2 where
  toJSON Item2{..} =
    object [
      "id" .= id,
      "quantity" .= quantity,
      "unit_amount" .= unitAmount
    ]
