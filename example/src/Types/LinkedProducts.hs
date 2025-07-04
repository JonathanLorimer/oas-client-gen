{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.LinkedProducts where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data LinkedProducts = LinkedProducts
  { linkType :: Text
  , sku :: Text
  , variantId :: Text
  }
  deriving (Show, Eq)

instance FromJSON LinkedProducts where
  parseJSON = withObject "LinkedProducts" $ \obj -> do
    linkType <- obj .: "link_type"
    sku <- obj .: "sku"
    variantId <- obj .: "variant_id"
    pure $ LinkedProducts{..}

instance ToJSON LinkedProducts where
  toJSON LinkedProducts{..} =
    object [
      "link_type" .= linkType,
      "sku" .= sku,
      "variant_id" .= variantId
    ]
