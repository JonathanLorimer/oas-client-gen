{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Variations5 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.ChildParentSkuRelationship5 (ChildParentSkuRelationship5)
import Types.VariationTheme5 (VariationTheme5)

data Variations5 = Variations5
  { childParentSkuRelationship :: ChildParentSkuRelationship5
  , parentageLevel :: Text
  , variationTheme :: VariationTheme5
  }
  deriving (Show, Eq)

instance FromJSON Variations5 where
  parseJSON = withObject "Variations5" $ \obj -> do
    childParentSkuRelationship <- obj .: "child_parent_sku_relationship"
    parentageLevel <- obj .: "parentage_level"
    variationTheme <- obj .: "variation_theme"
    pure $ Variations5{..}

instance ToJSON Variations5 where
  toJSON Variations5{..} =
    object [
      "child_parent_sku_relationship" .= childParentSkuRelationship,
      "parentage_level" .= parentageLevel,
      "variation_theme" .= variationTheme
    ]
