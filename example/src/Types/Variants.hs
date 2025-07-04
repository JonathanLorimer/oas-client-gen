{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Variants where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Variants = Variants
  { inventory :: Text
  }
  deriving (Show, Eq)

instance FromJSON Variants where
  parseJSON = withObject "Variants" $ \obj -> do
    inventory <- obj .: "inventory"
    pure $ Variants{..}

instance ToJSON Variants where
  toJSON Variants{..} =
    object [
      "inventory" .= inventory
    ]
