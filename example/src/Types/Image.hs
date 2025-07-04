{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Image where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.MainProductImageLocator (MainProductImageLocator)
import Types.OtherProductImageLocator1 (OtherProductImageLocator1)
import Types.OtherProductImageLocator2 (OtherProductImageLocator2)
import Types.OtherProductImageLocator3 (OtherProductImageLocator3)
import Types.OtherProductImageLocator4 (OtherProductImageLocator4)
import Types.OtherProductImageLocator5 (OtherProductImageLocator5)
import Types.OtherProductImageLocator6 (OtherProductImageLocator6)
import Types.OtherProductImageLocator7 (OtherProductImageLocator7)
import Types.OtherProductImageLocator8 (OtherProductImageLocator8)

data Image = Image
  { mainProductImageLocator :: MainProductImageLocator
  , otherProductImageLocator1 :: OtherProductImageLocator1
  , otherProductImageLocator2 :: OtherProductImageLocator2
  , otherProductImageLocator3 :: OtherProductImageLocator3
  , otherProductImageLocator4 :: OtherProductImageLocator4
  , otherProductImageLocator5 :: OtherProductImageLocator5
  , otherProductImageLocator6 :: OtherProductImageLocator6
  , otherProductImageLocator7 :: OtherProductImageLocator7
  , otherProductImageLocator8 :: OtherProductImageLocator8
  }
  deriving (Show, Eq)

instance FromJSON Image where
  parseJSON = withObject "Image" $ \obj -> do
    mainProductImageLocator <- obj .: "main_product_image_locator"
    otherProductImageLocator1 <- obj .: "other_product_image_locator_1"
    otherProductImageLocator2 <- obj .: "other_product_image_locator_2"
    otherProductImageLocator3 <- obj .: "other_product_image_locator_3"
    otherProductImageLocator4 <- obj .: "other_product_image_locator_4"
    otherProductImageLocator5 <- obj .: "other_product_image_locator_5"
    otherProductImageLocator6 <- obj .: "other_product_image_locator_6"
    otherProductImageLocator7 <- obj .: "other_product_image_locator_7"
    otherProductImageLocator8 <- obj .: "other_product_image_locator_8"
    pure $ Image{..}

instance ToJSON Image where
  toJSON Image{..} =
    object [
      "main_product_image_locator" .= mainProductImageLocator,
      "other_product_image_locator_1" .= otherProductImageLocator1,
      "other_product_image_locator_2" .= otherProductImageLocator2,
      "other_product_image_locator_3" .= otherProductImageLocator3,
      "other_product_image_locator_4" .= otherProductImageLocator4,
      "other_product_image_locator_5" .= otherProductImageLocator5,
      "other_product_image_locator_6" .= otherProductImageLocator6,
      "other_product_image_locator_7" .= otherProductImageLocator7,
      "other_product_image_locator_8" .= otherProductImageLocator8
    ]
