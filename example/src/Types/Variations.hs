{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Variations where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.ChildParentSkuRelationship (ChildParentSkuRelationship)
import Types.VariationTheme (VariationTheme)

data Variations = Variations
  { childParentSkuRelationship :: ChildParentSkuRelationship
  , parentageLevel :: Text
  , variationTheme :: VariationTheme
  }
  deriving (Show, Eq)

instance FromJSON Variations where
  parseJSON = withObject "Variations" $ \obj -> do
    childParentSkuRelationship <- obj .: "child_parent_sku_relationship"
    parentageLevel <- obj .: "parentage_level"
    variationTheme <- obj .: "variation_theme"
    pure $ Variations{..}

instance ToJSON Variations where
  toJSON Variations{..} =
    object [
      "child_parent_sku_relationship" .= childParentSkuRelationship,
      "parentage_level" .= parentageLevel,
      "variation_theme" .= variationTheme
    ]
