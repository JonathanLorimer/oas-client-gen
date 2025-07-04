{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ProductIdentity8 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data ProductIdentity8 = ProductIdentity8
  { brand :: Maybe Text
  , itemName :: Text
  , itemTypeKeyword :: Text
  }
  deriving (Show, Eq)

instance FromJSON ProductIdentity8 where
  parseJSON = withObject "ProductIdentity8" $ \obj -> do
    brand <- obj .: "brand"
    itemName <- obj .: "item_name"
    itemTypeKeyword <- obj .: "item_type_keyword"
    pure $ ProductIdentity8{..}

instance ToJSON ProductIdentity8 where
  toJSON ProductIdentity8{..} =
    object [
      "brand" .= brand,
      "item_name" .= itemName,
      "item_type_keyword" .= itemTypeKeyword
    ]
