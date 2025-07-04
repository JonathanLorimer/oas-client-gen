{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ChildParentSkuRelationship4 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data ChildParentSkuRelationship4 = ChildParentSkuRelationship4
  { childRelationshipType :: Text
  , parentSku :: Text
  }
  deriving (Show, Eq)

instance FromJSON ChildParentSkuRelationship4 where
  parseJSON = withObject "ChildParentSkuRelationship4" $ \obj -> do
    childRelationshipType <- obj .: "child_relationship_type"
    parentSku <- obj .: "parent_sku"
    pure $ ChildParentSkuRelationship4{..}

instance ToJSON ChildParentSkuRelationship4 where
  toJSON ChildParentSkuRelationship4{..} =
    object [
      "child_relationship_type" .= childRelationshipType,
      "parent_sku" .= parentSku
    ]
