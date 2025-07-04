{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Variations2 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.ChildParentSkuRelationship2 (ChildParentSkuRelationship2)
import Types.VariationTheme2 (VariationTheme2)

data Variations2 = Variations2
  { childParentSkuRelationship :: ChildParentSkuRelationship2
  , parentageLevel :: Text
  , variationTheme :: VariationTheme2
  }
  deriving (Show, Eq)

instance FromJSON Variations2 where
  parseJSON = withObject "Variations2" $ \obj -> do
    childParentSkuRelationship <- obj .: "child_parent_sku_relationship"
    parentageLevel <- obj .: "parentage_level"
    variationTheme <- obj .: "variation_theme"
    pure $ Variations2{..}

instance ToJSON Variations2 where
  toJSON Variations2{..} =
    object [
      "child_parent_sku_relationship" .= childParentSkuRelationship,
      "parentage_level" .= parentageLevel,
      "variation_theme" .= variationTheme
    ]
