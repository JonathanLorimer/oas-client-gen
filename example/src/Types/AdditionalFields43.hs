{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AdditionalFields43 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data AdditionalFields43 = AdditionalFields43
  { platformProductId :: Text
  , productType :: Text
  , totalAmount :: Double
  }
  deriving (Show, Eq)

instance FromJSON AdditionalFields43 where
  parseJSON = withObject "AdditionalFields43" $ \obj -> do
    platformProductId <- obj .: "platform_product_id"
    productType <- obj .: "product_type"
    totalAmount <- obj .: "total_amount"
    pure $ AdditionalFields43{..}

instance ToJSON AdditionalFields43 where
  toJSON AdditionalFields43{..} =
    object [
      "platform_product_id" .= platformProductId,
      "product_type" .= productType,
      "total_amount" .= totalAmount
    ]
