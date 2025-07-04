{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ProductIdentity6 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data ProductIdentity6 = ProductIdentity6
  { brand :: Maybe Text
  , itemName :: Text
  , itemTypeKeyword :: Text
  , modelName :: Text
  }
  deriving (Show, Eq)

instance FromJSON ProductIdentity6 where
  parseJSON = withObject "ProductIdentity6" $ \obj -> do
    brand <- obj .: "brand"
    itemName <- obj .: "item_name"
    itemTypeKeyword <- obj .: "item_type_keyword"
    modelName <- obj .: "model_name"
    pure $ ProductIdentity6{..}

instance ToJSON ProductIdentity6 where
  toJSON ProductIdentity6{..} =
    object [
      "brand" .= brand,
      "item_name" .= itemName,
      "item_type_keyword" .= itemTypeKeyword,
      "model_name" .= modelName
    ]
