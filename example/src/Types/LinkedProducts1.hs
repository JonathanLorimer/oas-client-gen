{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.LinkedProducts1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data LinkedProducts1 = LinkedProducts1
  { linkType :: Text
  , sku :: Text
  , variantId :: Text
  }
  deriving (Show, Eq)

instance FromJSON LinkedProducts1 where
  parseJSON = withObject "LinkedProducts1" $ \obj -> do
    linkType <- obj .: "link_type"
    sku <- obj .: "sku"
    variantId <- obj .: "variant_id"
    pure $ LinkedProducts1{..}

instance ToJSON LinkedProducts1 where
  toJSON LinkedProducts1{..} =
    object [
      "link_type" .= linkType,
      "sku" .= sku,
      "variant_id" .= variantId
    ]
