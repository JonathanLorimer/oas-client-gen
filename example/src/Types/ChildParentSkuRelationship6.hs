{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ChildParentSkuRelationship6 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data ChildParentSkuRelationship6 = ChildParentSkuRelationship6
  { childRelationshipType :: Text
  , parentSku :: Text
  }
  deriving (Show, Eq)

instance FromJSON ChildParentSkuRelationship6 where
  parseJSON = withObject "ChildParentSkuRelationship6" $ \obj -> do
    childRelationshipType <- obj .: "child_relationship_type"
    parentSku <- obj .: "parent_sku"
    pure $ ChildParentSkuRelationship6{..}

instance ToJSON ChildParentSkuRelationship6 where
  toJSON ChildParentSkuRelationship6{..} =
    object [
      "child_relationship_type" .= childRelationshipType,
      "parent_sku" .= parentSku
    ]
