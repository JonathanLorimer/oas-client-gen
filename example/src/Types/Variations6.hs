{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Variations6 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.ChildParentSkuRelationship6 (ChildParentSkuRelationship6)
import Types.VariationTheme6 (VariationTheme6)

data Variations6 = Variations6
  { childParentSkuRelationship :: ChildParentSkuRelationship6
  , parentageLevel :: Text
  , variationTheme :: VariationTheme6
  }
  deriving (Show, Eq)

instance FromJSON Variations6 where
  parseJSON = withObject "Variations6" $ \obj -> do
    childParentSkuRelationship <- obj .: "child_parent_sku_relationship"
    parentageLevel <- obj .: "parentage_level"
    variationTheme <- obj .: "variation_theme"
    pure $ Variations6{..}

instance ToJSON Variations6 where
  toJSON Variations6{..} =
    object [
      "child_parent_sku_relationship" .= childParentSkuRelationship,
      "parentage_level" .= parentageLevel,
      "variation_theme" .= variationTheme
    ]
