{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Variations7 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.ChildParentSkuRelationship7 (ChildParentSkuRelationship7)
import Types.VariationTheme7 (VariationTheme7)

data Variations7 = Variations7
  { childParentSkuRelationship :: ChildParentSkuRelationship7
  , parentageLevel :: Text
  , variationTheme :: VariationTheme7
  }
  deriving (Show, Eq)

instance FromJSON Variations7 where
  parseJSON = withObject "Variations7" $ \obj -> do
    childParentSkuRelationship <- obj .: "child_parent_sku_relationship"
    parentageLevel <- obj .: "parentage_level"
    variationTheme <- obj .: "variation_theme"
    pure $ Variations7{..}

instance ToJSON Variations7 where
  toJSON Variations7{..} =
    object [
      "child_parent_sku_relationship" .= childParentSkuRelationship,
      "parentage_level" .= parentageLevel,
      "variation_theme" .= variationTheme
    ]
