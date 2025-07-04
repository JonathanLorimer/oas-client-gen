{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Variations1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.ChildParentSkuRelationship1 (ChildParentSkuRelationship1)
import Types.VariationTheme1 (VariationTheme1)

data Variations1 = Variations1
  { childParentSkuRelationship :: ChildParentSkuRelationship1
  , parentageLevel :: Text
  , variationTheme :: VariationTheme1
  }
  deriving (Show, Eq)

instance FromJSON Variations1 where
  parseJSON = withObject "Variations1" $ \obj -> do
    childParentSkuRelationship <- obj .: "child_parent_sku_relationship"
    parentageLevel <- obj .: "parentage_level"
    variationTheme <- obj .: "variation_theme"
    pure $ Variations1{..}

instance ToJSON Variations1 where
  toJSON Variations1{..} =
    object [
      "child_parent_sku_relationship" .= childParentSkuRelationship,
      "parentage_level" .= parentageLevel,
      "variation_theme" .= variationTheme
    ]
