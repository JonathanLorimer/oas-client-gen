{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Image4 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.MainProductImageLocator4 (MainProductImageLocator4)
import Types.OtherProductImageLocator14 (OtherProductImageLocator14)
import Types.OtherProductImageLocator24 (OtherProductImageLocator24)
import Types.OtherProductImageLocator34 (OtherProductImageLocator34)
import Types.OtherProductImageLocator44 (OtherProductImageLocator44)
import Types.OtherProductImageLocator54 (OtherProductImageLocator54)
import Types.OtherProductImageLocator64 (OtherProductImageLocator64)
import Types.OtherProductImageLocator74 (OtherProductImageLocator74)
import Types.OtherProductImageLocator84 (OtherProductImageLocator84)

data Image4 = Image4
  { mainProductImageLocator :: MainProductImageLocator4
  , otherProductImageLocator1 :: OtherProductImageLocator14
  , otherProductImageLocator2 :: OtherProductImageLocator24
  , otherProductImageLocator3 :: OtherProductImageLocator34
  , otherProductImageLocator4 :: OtherProductImageLocator44
  , otherProductImageLocator5 :: OtherProductImageLocator54
  , otherProductImageLocator6 :: OtherProductImageLocator64
  , otherProductImageLocator7 :: OtherProductImageLocator74
  , otherProductImageLocator8 :: OtherProductImageLocator84
  }
  deriving (Show, Eq)

instance FromJSON Image4 where
  parseJSON = withObject "Image4" $ \obj -> do
    mainProductImageLocator <- obj .: "main_product_image_locator"
    otherProductImageLocator1 <- obj .: "other_product_image_locator_1"
    otherProductImageLocator2 <- obj .: "other_product_image_locator_2"
    otherProductImageLocator3 <- obj .: "other_product_image_locator_3"
    otherProductImageLocator4 <- obj .: "other_product_image_locator_4"
    otherProductImageLocator5 <- obj .: "other_product_image_locator_5"
    otherProductImageLocator6 <- obj .: "other_product_image_locator_6"
    otherProductImageLocator7 <- obj .: "other_product_image_locator_7"
    otherProductImageLocator8 <- obj .: "other_product_image_locator_8"
    pure $ Image4{..}

instance ToJSON Image4 where
  toJSON Image4{..} =
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
