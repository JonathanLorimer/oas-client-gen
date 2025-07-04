{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Image5 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.MainProductImageLocator5 (MainProductImageLocator5)
import Types.OtherProductImageLocator15 (OtherProductImageLocator15)
import Types.OtherProductImageLocator25 (OtherProductImageLocator25)
import Types.OtherProductImageLocator35 (OtherProductImageLocator35)
import Types.OtherProductImageLocator45 (OtherProductImageLocator45)
import Types.OtherProductImageLocator55 (OtherProductImageLocator55)
import Types.OtherProductImageLocator65 (OtherProductImageLocator65)
import Types.OtherProductImageLocator75 (OtherProductImageLocator75)
import Types.OtherProductImageLocator85 (OtherProductImageLocator85)

data Image5 = Image5
  { mainProductImageLocator :: MainProductImageLocator5
  , otherProductImageLocator1 :: OtherProductImageLocator15
  , otherProductImageLocator2 :: OtherProductImageLocator25
  , otherProductImageLocator3 :: OtherProductImageLocator35
  , otherProductImageLocator4 :: OtherProductImageLocator45
  , otherProductImageLocator5 :: OtherProductImageLocator55
  , otherProductImageLocator6 :: OtherProductImageLocator65
  , otherProductImageLocator7 :: OtherProductImageLocator75
  , otherProductImageLocator8 :: OtherProductImageLocator85
  }
  deriving (Show, Eq)

instance FromJSON Image5 where
  parseJSON = withObject "Image5" $ \obj -> do
    mainProductImageLocator <- obj .: "main_product_image_locator"
    otherProductImageLocator1 <- obj .: "other_product_image_locator_1"
    otherProductImageLocator2 <- obj .: "other_product_image_locator_2"
    otherProductImageLocator3 <- obj .: "other_product_image_locator_3"
    otherProductImageLocator4 <- obj .: "other_product_image_locator_4"
    otherProductImageLocator5 <- obj .: "other_product_image_locator_5"
    otherProductImageLocator6 <- obj .: "other_product_image_locator_6"
    otherProductImageLocator7 <- obj .: "other_product_image_locator_7"
    otherProductImageLocator8 <- obj .: "other_product_image_locator_8"
    pure $ Image5{..}

instance ToJSON Image5 where
  toJSON Image5{..} =
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
