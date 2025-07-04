{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Image1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.MainProductImageLocator1 (MainProductImageLocator1)
import Types.OtherProductImageLocator11 (OtherProductImageLocator11)
import Types.OtherProductImageLocator21 (OtherProductImageLocator21)
import Types.OtherProductImageLocator31 (OtherProductImageLocator31)
import Types.OtherProductImageLocator41 (OtherProductImageLocator41)
import Types.OtherProductImageLocator51 (OtherProductImageLocator51)
import Types.OtherProductImageLocator61 (OtherProductImageLocator61)
import Types.OtherProductImageLocator71 (OtherProductImageLocator71)
import Types.OtherProductImageLocator81 (OtherProductImageLocator81)

data Image1 = Image1
  { mainProductImageLocator :: MainProductImageLocator1
  , otherProductImageLocator1 :: OtherProductImageLocator11
  , otherProductImageLocator2 :: OtherProductImageLocator21
  , otherProductImageLocator3 :: OtherProductImageLocator31
  , otherProductImageLocator4 :: OtherProductImageLocator41
  , otherProductImageLocator5 :: OtherProductImageLocator51
  , otherProductImageLocator6 :: OtherProductImageLocator61
  , otherProductImageLocator7 :: OtherProductImageLocator71
  , otherProductImageLocator8 :: OtherProductImageLocator81
  }
  deriving (Show, Eq)

instance FromJSON Image1 where
  parseJSON = withObject "Image1" $ \obj -> do
    mainProductImageLocator <- obj .: "main_product_image_locator"
    otherProductImageLocator1 <- obj .: "other_product_image_locator_1"
    otherProductImageLocator2 <- obj .: "other_product_image_locator_2"
    otherProductImageLocator3 <- obj .: "other_product_image_locator_3"
    otherProductImageLocator4 <- obj .: "other_product_image_locator_4"
    otherProductImageLocator5 <- obj .: "other_product_image_locator_5"
    otherProductImageLocator6 <- obj .: "other_product_image_locator_6"
    otherProductImageLocator7 <- obj .: "other_product_image_locator_7"
    otherProductImageLocator8 <- obj .: "other_product_image_locator_8"
    pure $ Image1{..}

instance ToJSON Image1 where
  toJSON Image1{..} =
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
