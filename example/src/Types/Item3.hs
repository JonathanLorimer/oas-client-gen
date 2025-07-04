{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Item3 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Item3 = Item3
  { id :: Text
  , quantity :: Double
  , unitAmount :: Double
  }
  deriving (Show, Eq)

instance FromJSON Item3 where
  parseJSON = withObject "Item3" $ \obj -> do
    id <- obj .: "id"
    quantity <- obj .: "quantity"
    unitAmount <- obj .: "unit_amount"
    pure $ Item3{..}

instance ToJSON Item3 where
  toJSON Item3{..} =
    object [
      "id" .= id,
      "quantity" .= quantity,
      "unit_amount" .= unitAmount
    ]
