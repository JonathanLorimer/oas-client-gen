{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ChildParentSkuRelationship2 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data ChildParentSkuRelationship2 = ChildParentSkuRelationship2
  { childRelationshipType :: Text
  , parentSku :: Text
  }
  deriving (Show, Eq)

instance FromJSON ChildParentSkuRelationship2 where
  parseJSON = withObject "ChildParentSkuRelationship2" $ \obj -> do
    childRelationshipType <- obj .: "child_relationship_type"
    parentSku <- obj .: "parent_sku"
    pure $ ChildParentSkuRelationship2{..}

instance ToJSON ChildParentSkuRelationship2 where
  toJSON ChildParentSkuRelationship2{..} =
    object [
      "child_relationship_type" .= childRelationshipType,
      "parent_sku" .= parentSku
    ]
