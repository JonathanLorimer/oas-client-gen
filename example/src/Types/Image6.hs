{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Image6 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.MainProductImageLocator6 (MainProductImageLocator6)
import Types.OtherProductImageLocator16 (OtherProductImageLocator16)
import Types.OtherProductImageLocator26 (OtherProductImageLocator26)
import Types.OtherProductImageLocator36 (OtherProductImageLocator36)
import Types.OtherProductImageLocator46 (OtherProductImageLocator46)
import Types.OtherProductImageLocator56 (OtherProductImageLocator56)
import Types.OtherProductImageLocator66 (OtherProductImageLocator66)
import Types.OtherProductImageLocator76 (OtherProductImageLocator76)
import Types.OtherProductImageLocator86 (OtherProductImageLocator86)

data Image6 = Image6
  { mainProductImageLocator :: MainProductImageLocator6
  , otherProductImageLocator1 :: OtherProductImageLocator16
  , otherProductImageLocator2 :: OtherProductImageLocator26
  , otherProductImageLocator3 :: OtherProductImageLocator36
  , otherProductImageLocator4 :: OtherProductImageLocator46
  , otherProductImageLocator5 :: OtherProductImageLocator56
  , otherProductImageLocator6 :: OtherProductImageLocator66
  , otherProductImageLocator7 :: OtherProductImageLocator76
  , otherProductImageLocator8 :: OtherProductImageLocator86
  }
  deriving (Show, Eq)

instance FromJSON Image6 where
  parseJSON = withObject "Image6" $ \obj -> do
    mainProductImageLocator <- obj .: "main_product_image_locator"
    otherProductImageLocator1 <- obj .: "other_product_image_locator_1"
    otherProductImageLocator2 <- obj .: "other_product_image_locator_2"
    otherProductImageLocator3 <- obj .: "other_product_image_locator_3"
    otherProductImageLocator4 <- obj .: "other_product_image_locator_4"
    otherProductImageLocator5 <- obj .: "other_product_image_locator_5"
    otherProductImageLocator6 <- obj .: "other_product_image_locator_6"
    otherProductImageLocator7 <- obj .: "other_product_image_locator_7"
    otherProductImageLocator8 <- obj .: "other_product_image_locator_8"
    pure $ Image6{..}

instance ToJSON Image6 where
  toJSON Image6{..} =
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
