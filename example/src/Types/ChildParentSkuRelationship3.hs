{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ChildParentSkuRelationship3 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data ChildParentSkuRelationship3 = ChildParentSkuRelationship3
  { childRelationshipType :: Text
  , parentSku :: Text
  }
  deriving (Show, Eq)

instance FromJSON ChildParentSkuRelationship3 where
  parseJSON = withObject "ChildParentSkuRelationship3" $ \obj -> do
    childRelationshipType <- obj .: "child_relationship_type"
    parentSku <- obj .: "parent_sku"
    pure $ ChildParentSkuRelationship3{..}

instance ToJSON ChildParentSkuRelationship3 where
  toJSON ChildParentSkuRelationship3{..} =
    object [
      "child_relationship_type" .= childRelationshipType,
      "parent_sku" .= parentSku
    ]
