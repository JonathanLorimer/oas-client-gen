{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ProductIdentity1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data ProductIdentity1 = ProductIdentity1
  { brand :: Maybe Text
  , itemName :: Text
  , itemTypeKeyword :: Text
  , manufacturer :: Text
  , modelName :: Text
  , modelNumber :: Text
  }
  deriving (Show, Eq)

instance FromJSON ProductIdentity1 where
  parseJSON = withObject "ProductIdentity1" $ \obj -> do
    brand <- obj .: "brand"
    itemName <- obj .: "item_name"
    itemTypeKeyword <- obj .: "item_type_keyword"
    manufacturer <- obj .: "manufacturer"
    modelName <- obj .: "model_name"
    modelNumber <- obj .: "model_number"
    pure $ ProductIdentity1{..}

instance ToJSON ProductIdentity1 where
  toJSON ProductIdentity1{..} =
    object [
      "brand" .= brand,
      "item_name" .= itemName,
      "item_type_keyword" .= itemTypeKeyword,
      "manufacturer" .= manufacturer,
      "model_name" .= modelName,
      "model_number" .= modelNumber
    ]
