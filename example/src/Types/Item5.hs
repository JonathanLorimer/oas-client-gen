{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Item5 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Item5 = Item5
  { id :: Text
  , quantity :: Double
  , unitAmount :: Double
  }
  deriving (Show, Eq)

instance FromJSON Item5 where
  parseJSON = withObject "Item5" $ \obj -> do
    id <- obj .: "id"
    quantity <- obj .: "quantity"
    unitAmount <- obj .: "unit_amount"
    pure $ Item5{..}

instance ToJSON Item5 where
  toJSON Item5{..} =
    object [
      "id" .= id,
      "quantity" .= quantity,
      "unit_amount" .= unitAmount
    ]
