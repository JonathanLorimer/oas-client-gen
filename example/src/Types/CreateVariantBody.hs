{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateVariantBody where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.Images4 (Images4)
import Types.Inventory2 (Inventory2)
import Types.OptionValues2 (OptionValues2)
import Types.Variant (Variant)
import Types.Weight2 (Weight2)

data CreateVariantBody = CreateVariantBody
  { variant :: Variant
  }
  deriving (Show, Eq)

instance FromJSON CreateVariantBody where
  parseJSON = withObject "CreateVariantBody" $ \obj -> do
    variant <- obj .: "variant"
    pure $ CreateVariantBody{..}

instance ToJSON CreateVariantBody where
  toJSON CreateVariantBody{..} =
    object [
      "variant" .= variant
    ]
