{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Variations3 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.ChildParentSkuRelationship3 (ChildParentSkuRelationship3)
import Types.VariationTheme3 (VariationTheme3)

data Variations3 = Variations3
  { childParentSkuRelationship :: ChildParentSkuRelationship3
  , parentageLevel :: Text
  , variationTheme :: VariationTheme3
  }
  deriving (Show, Eq)

instance FromJSON Variations3 where
  parseJSON = withObject "Variations3" $ \obj -> do
    childParentSkuRelationship <- obj .: "child_parent_sku_relationship"
    parentageLevel <- obj .: "parentage_level"
    variationTheme <- obj .: "variation_theme"
    pure $ Variations3{..}

instance ToJSON Variations3 where
  toJSON Variations3{..} =
    object [
      "child_parent_sku_relationship" .= childParentSkuRelationship,
      "parentage_level" .= parentageLevel,
      "variation_theme" .= variationTheme
    ]
