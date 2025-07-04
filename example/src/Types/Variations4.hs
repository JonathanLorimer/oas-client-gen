{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Variations4 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.ChildParentSkuRelationship4 (ChildParentSkuRelationship4)
import Types.VariationTheme4 (VariationTheme4)

data Variations4 = Variations4
  { childParentSkuRelationship :: ChildParentSkuRelationship4
  , parentageLevel :: Text
  , variationTheme :: VariationTheme4
  }
  deriving (Show, Eq)

instance FromJSON Variations4 where
  parseJSON = withObject "Variations4" $ \obj -> do
    childParentSkuRelationship <- obj .: "child_parent_sku_relationship"
    parentageLevel <- obj .: "parentage_level"
    variationTheme <- obj .: "variation_theme"
    pure $ Variations4{..}

instance ToJSON Variations4 where
  toJSON Variations4{..} =
    object [
      "child_parent_sku_relationship" .= childParentSkuRelationship,
      "parentage_level" .= parentageLevel,
      "variation_theme" .= variationTheme
    ]
