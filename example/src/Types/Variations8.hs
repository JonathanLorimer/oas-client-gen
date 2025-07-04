{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Variations8 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.ChildParentSkuRelationship8 (ChildParentSkuRelationship8)
import Types.VariationTheme8 (VariationTheme8)

data Variations8 = Variations8
  { childParentSkuRelationship :: ChildParentSkuRelationship8
  , parentageLevel :: Text
  , variationTheme :: VariationTheme8
  }
  deriving (Show, Eq)

instance FromJSON Variations8 where
  parseJSON = withObject "Variations8" $ \obj -> do
    childParentSkuRelationship <- obj .: "child_parent_sku_relationship"
    parentageLevel <- obj .: "parentage_level"
    variationTheme <- obj .: "variation_theme"
    pure $ Variations8{..}

instance ToJSON Variations8 where
  toJSON Variations8{..} =
    object [
      "child_parent_sku_relationship" .= childParentSkuRelationship,
      "parentage_level" .= parentageLevel,
      "variation_theme" .= variationTheme
    ]
