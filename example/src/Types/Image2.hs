{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Image2 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.MainProductImageLocator2 (MainProductImageLocator2)
import Types.OtherProductImageLocator12 (OtherProductImageLocator12)
import Types.OtherProductImageLocator22 (OtherProductImageLocator22)
import Types.OtherProductImageLocator32 (OtherProductImageLocator32)
import Types.OtherProductImageLocator42 (OtherProductImageLocator42)
import Types.OtherProductImageLocator52 (OtherProductImageLocator52)
import Types.OtherProductImageLocator62 (OtherProductImageLocator62)
import Types.OtherProductImageLocator72 (OtherProductImageLocator72)
import Types.OtherProductImageLocator82 (OtherProductImageLocator82)

data Image2 = Image2
  { mainProductImageLocator :: MainProductImageLocator2
  , otherProductImageLocator1 :: OtherProductImageLocator12
  , otherProductImageLocator2 :: OtherProductImageLocator22
  , otherProductImageLocator3 :: OtherProductImageLocator32
  , otherProductImageLocator4 :: OtherProductImageLocator42
  , otherProductImageLocator5 :: OtherProductImageLocator52
  , otherProductImageLocator6 :: OtherProductImageLocator62
  , otherProductImageLocator7 :: OtherProductImageLocator72
  , otherProductImageLocator8 :: OtherProductImageLocator82
  }
  deriving (Show, Eq)

instance FromJSON Image2 where
  parseJSON = withObject "Image2" $ \obj -> do
    mainProductImageLocator <- obj .: "main_product_image_locator"
    otherProductImageLocator1 <- obj .: "other_product_image_locator_1"
    otherProductImageLocator2 <- obj .: "other_product_image_locator_2"
    otherProductImageLocator3 <- obj .: "other_product_image_locator_3"
    otherProductImageLocator4 <- obj .: "other_product_image_locator_4"
    otherProductImageLocator5 <- obj .: "other_product_image_locator_5"
    otherProductImageLocator6 <- obj .: "other_product_image_locator_6"
    otherProductImageLocator7 <- obj .: "other_product_image_locator_7"
    otherProductImageLocator8 <- obj .: "other_product_image_locator_8"
    pure $ Image2{..}

instance ToJSON Image2 where
  toJSON Image2{..} =
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
