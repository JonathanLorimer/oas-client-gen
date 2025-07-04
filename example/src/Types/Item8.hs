{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Item8 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Item8 = Item8
  { id :: Maybe Text
  , quantity :: Maybe Double
  , unitAmount :: Maybe Double
  }
  deriving (Show, Eq)

instance FromJSON Item8 where
  parseJSON = withObject "Item8" $ \obj -> do
    id <- obj .: "id"
    quantity <- obj .: "quantity"
    unitAmount <- obj .: "unit_amount"
    pure $ Item8{..}

instance ToJSON Item8 where
  toJSON Item8{..} =
    object [
      "id" .= id,
      "quantity" .= quantity,
      "unit_amount" .= unitAmount
    ]
