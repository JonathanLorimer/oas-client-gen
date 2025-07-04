{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ProductIdentity7 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data ProductIdentity7 = ProductIdentity7
  { brand :: Maybe Text
  , itemName :: Text
  , itemTypeKeyword :: Text
  , modelName :: Text
  , modelNumber :: Text
  }
  deriving (Show, Eq)

instance FromJSON ProductIdentity7 where
  parseJSON = withObject "ProductIdentity7" $ \obj -> do
    brand <- obj .: "brand"
    itemName <- obj .: "item_name"
    itemTypeKeyword <- obj .: "item_type_keyword"
    modelName <- obj .: "model_name"
    modelNumber <- obj .: "model_number"
    pure $ ProductIdentity7{..}

instance ToJSON ProductIdentity7 where
  toJSON ProductIdentity7{..} =
    object [
      "brand" .= brand,
      "item_name" .= itemName,
      "item_type_keyword" .= itemTypeKeyword,
      "model_name" .= modelName,
      "model_number" .= modelNumber
    ]
