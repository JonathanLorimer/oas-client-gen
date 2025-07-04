{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.LineItems24 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data LineItems24 = LineItems24
  { lineItemId :: Text
  , quantity :: Double
  }
  deriving (Show, Eq)

instance FromJSON LineItems24 where
  parseJSON = withObject "LineItems24" $ \obj -> do
    lineItemId <- obj .: "line_item_id"
    quantity <- obj .: "quantity"
    pure $ LineItems24{..}

instance ToJSON LineItems24 where
  toJSON LineItems24{..} =
    object [
      "line_item_id" .= lineItemId,
      "quantity" .= quantity
    ]
