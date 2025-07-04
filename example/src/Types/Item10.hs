{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Item10 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Item10 = Item10
  { id :: Text
  , quantity :: Maybe Double
  , unitAmount :: Maybe Double
  }
  deriving (Show, Eq)

instance FromJSON Item10 where
  parseJSON = withObject "Item10" $ \obj -> do
    id <- obj .: "id"
    quantity <- obj .: "quantity"
    unitAmount <- obj .: "unit_amount"
    pure $ Item10{..}

instance ToJSON Item10 where
  toJSON Item10{..} =
    object [
      "id" .= id,
      "quantity" .= quantity,
      "unit_amount" .= unitAmount
    ]
