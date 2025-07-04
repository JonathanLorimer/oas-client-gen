{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Item7 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Item7 = Item7
  { id :: Text
  , quantity :: Double
  , unitAmount :: Text
  }
  deriving (Show, Eq)

instance FromJSON Item7 where
  parseJSON = withObject "Item7" $ \obj -> do
    id <- obj .: "id"
    quantity <- obj .: "quantity"
    unitAmount <- obj .: "unit_amount"
    pure $ Item7{..}

instance ToJSON Item7 where
  toJSON Item7{..} =
    object [
      "id" .= id,
      "quantity" .= quantity,
      "unit_amount" .= unitAmount
    ]
