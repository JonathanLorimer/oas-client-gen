{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ProductIdentity3 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data ProductIdentity3 = ProductIdentity3
  { brand :: Maybe Text
  , itemName :: Text
  , itemTypeKeyword :: Text
  , manufacturer :: Text
  , modelName :: Text
  , modelNumber :: Text
  }
  deriving (Show, Eq)

instance FromJSON ProductIdentity3 where
  parseJSON = withObject "ProductIdentity3" $ \obj -> do
    brand <- obj .: "brand"
    itemName <- obj .: "item_name"
    itemTypeKeyword <- obj .: "item_type_keyword"
    manufacturer <- obj .: "manufacturer"
    modelName <- obj .: "model_name"
    modelNumber <- obj .: "model_number"
    pure $ ProductIdentity3{..}

instance ToJSON ProductIdentity3 where
  toJSON ProductIdentity3{..} =
    object [
      "brand" .= brand,
      "item_name" .= itemName,
      "item_type_keyword" .= itemTypeKeyword,
      "manufacturer" .= manufacturer,
      "model_name" .= modelName,
      "model_number" .= modelNumber
    ]
