{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.LineItems23 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data LineItems23 = LineItems23
  { quantity :: Double
  , variantId :: Text
  }
  deriving (Show, Eq)

instance FromJSON LineItems23 where
  parseJSON = withObject "LineItems23" $ \obj -> do
    quantity <- obj .: "quantity"
    variantId <- obj .: "variant_id"
    pure $ LineItems23{..}

instance ToJSON LineItems23 where
  toJSON LineItems23{..} =
    object [
      "quantity" .= quantity,
      "variant_id" .= variantId
    ]
