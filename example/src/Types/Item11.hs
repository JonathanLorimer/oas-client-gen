{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Item11 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Item11 = Item11
  { id :: Text
  , quantity :: Maybe Double
  , unitAmount :: Maybe Double
  }
  deriving (Show, Eq)

instance FromJSON Item11 where
  parseJSON = withObject "Item11" $ \obj -> do
    id <- obj .: "id"
    quantity <- obj .: "quantity"
    unitAmount <- obj .: "unit_amount"
    pure $ Item11{..}

instance ToJSON Item11 where
  toJSON Item11{..} =
    object [
      "id" .= id,
      "quantity" .= quantity,
      "unit_amount" .= unitAmount
    ]
