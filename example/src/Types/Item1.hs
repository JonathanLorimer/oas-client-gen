{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Item1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Item1 = Item1
  { id :: Text
  , quantity :: Double
  , unitAmount :: Double
  }
  deriving (Show, Eq)

instance FromJSON Item1 where
  parseJSON = withObject "Item1" $ \obj -> do
    id <- obj .: "id"
    quantity <- obj .: "quantity"
    unitAmount <- obj .: "unit_amount"
    pure $ Item1{..}

instance ToJSON Item1 where
  toJSON Item1{..} =
    object [
      "id" .= id,
      "quantity" .= quantity,
      "unit_amount" .= unitAmount
    ]
