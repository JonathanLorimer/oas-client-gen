{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.LineItems25 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AdditionalFields43 (AdditionalFields43)

data LineItems25 = LineItems25
  { additionalFields :: AdditionalFields43
  , id :: Text
  , price :: Double
  , productId :: Maybe Text
  , quantity :: Double
  , sku :: Text
  , title :: Text
  , variantId :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON LineItems25 where
  parseJSON = withObject "LineItems25" $ \obj -> do
    additionalFields <- obj .: "additional_fields"
    id <- obj .: "id"
    price <- obj .: "price"
    productId <- obj .: "product_id"
    quantity <- obj .: "quantity"
    sku <- obj .: "sku"
    title <- obj .: "title"
    variantId <- obj .: "variant_id"
    pure $ LineItems25{..}

instance ToJSON LineItems25 where
  toJSON LineItems25{..} =
    object [
      "additional_fields" .= additionalFields,
      "id" .= id,
      "price" .= price,
      "product_id" .= productId,
      "quantity" .= quantity,
      "sku" .= sku,
      "title" .= title,
      "variant_id" .= variantId
    ]
