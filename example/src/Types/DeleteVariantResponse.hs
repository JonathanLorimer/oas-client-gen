{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.DeleteVariantResponse where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data DeleteVariantResponse = DeleteVariantResponse
  { productId :: Text
  , variantId :: Text
  }
  deriving (Show, Eq)

instance FromJSON DeleteVariantResponse where
  parseJSON = withObject "DeleteVariantResponse" $ \obj -> do
    productId <- obj .: "productId"
    variantId <- obj .: "variantId"
    pure $ DeleteVariantResponse{..}

instance ToJSON DeleteVariantResponse where
  toJSON DeleteVariantResponse{..} =
    object [
      "productId" .= productId,
      "variantId" .= variantId
    ]
