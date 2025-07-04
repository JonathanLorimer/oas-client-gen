{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ProductIdentity where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data ProductIdentity = ProductIdentity
  { brand :: Maybe Text
  , itemName :: Text
  , itemTypeKeyword :: Text
  , manufacturer :: Text
  }
  deriving (Show, Eq)

instance FromJSON ProductIdentity where
  parseJSON = withObject "ProductIdentity" $ \obj -> do
    brand <- obj .: "brand"
    itemName <- obj .: "item_name"
    itemTypeKeyword <- obj .: "item_type_keyword"
    manufacturer <- obj .: "manufacturer"
    pure $ ProductIdentity{..}

instance ToJSON ProductIdentity where
  toJSON ProductIdentity{..} =
    object [
      "brand" .= brand,
      "item_name" .= itemName,
      "item_type_keyword" .= itemTypeKeyword,
      "manufacturer" .= manufacturer
    ]
