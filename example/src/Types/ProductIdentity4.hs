{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ProductIdentity4 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data ProductIdentity4 = ProductIdentity4
  { brand :: Maybe Text
  , itemName :: Text
  , itemTypeKeyword :: Text
  , manufacturer :: Text
  }
  deriving (Show, Eq)

instance FromJSON ProductIdentity4 where
  parseJSON = withObject "ProductIdentity4" $ \obj -> do
    brand <- obj .: "brand"
    itemName <- obj .: "item_name"
    itemTypeKeyword <- obj .: "item_type_keyword"
    manufacturer <- obj .: "manufacturer"
    pure $ ProductIdentity4{..}

instance ToJSON ProductIdentity4 where
  toJSON ProductIdentity4{..} =
    object [
      "brand" .= brand,
      "item_name" .= itemName,
      "item_type_keyword" .= itemTypeKeyword,
      "manufacturer" .= manufacturer
    ]
