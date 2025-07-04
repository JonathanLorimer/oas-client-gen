{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ProductDetails4 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data ProductDetails4 = ProductDetails4
  { bulletPoint :: Text
  , partNumber :: Text
  , productDescription :: Text
  }
  deriving (Show, Eq)

instance FromJSON ProductDetails4 where
  parseJSON = withObject "ProductDetails4" $ \obj -> do
    bulletPoint <- obj .: "bullet_point"
    partNumber <- obj .: "part_number"
    productDescription <- obj .: "product_description"
    pure $ ProductDetails4{..}

instance ToJSON ProductDetails4 where
  toJSON ProductDetails4{..} =
    object [
      "bullet_point" .= bulletPoint,
      "part_number" .= partNumber,
      "product_description" .= productDescription
    ]
