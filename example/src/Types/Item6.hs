{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Item6 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Item6 = Item6
  { id :: Text
  , quantity :: Double
  , unitAmount :: Double
  }
  deriving (Show, Eq)

instance FromJSON Item6 where
  parseJSON = withObject "Item6" $ \obj -> do
    id <- obj .: "id"
    quantity <- obj .: "quantity"
    unitAmount <- obj .: "unit_amount"
    pure $ Item6{..}

instance ToJSON Item6 where
  toJSON Item6{..} =
    object [
      "id" .= id,
      "quantity" .= quantity,
      "unit_amount" .= unitAmount
    ]
