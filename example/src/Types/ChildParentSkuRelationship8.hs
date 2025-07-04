{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ChildParentSkuRelationship8 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data ChildParentSkuRelationship8 = ChildParentSkuRelationship8
  { childRelationshipType :: Text
  , parentSku :: Text
  }
  deriving (Show, Eq)

instance FromJSON ChildParentSkuRelationship8 where
  parseJSON = withObject "ChildParentSkuRelationship8" $ \obj -> do
    childRelationshipType <- obj .: "child_relationship_type"
    parentSku <- obj .: "parent_sku"
    pure $ ChildParentSkuRelationship8{..}

instance ToJSON ChildParentSkuRelationship8 where
  toJSON ChildParentSkuRelationship8{..} =
    object [
      "child_relationship_type" .= childRelationshipType,
      "parent_sku" .= parentSku
    ]
