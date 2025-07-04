{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Item12 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Item12 = Item12
  { id :: Text
  , quantity :: Double
  , unitAmount :: Double
  }
  deriving (Show, Eq)

instance FromJSON Item12 where
  parseJSON = withObject "Item12" $ \obj -> do
    id <- obj .: "id"
    quantity <- obj .: "quantity"
    unitAmount <- obj .: "unit_amount"
    pure $ Item12{..}

instance ToJSON Item12 where
  toJSON Item12{..} =
    object [
      "id" .= id,
      "quantity" .= quantity,
      "unit_amount" .= unitAmount
    ]
