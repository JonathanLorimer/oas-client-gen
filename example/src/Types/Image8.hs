{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Image8 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.MainProductImageLocator8 (MainProductImageLocator8)
import Types.OtherProductImageLocator18 (OtherProductImageLocator18)
import Types.OtherProductImageLocator28 (OtherProductImageLocator28)
import Types.OtherProductImageLocator38 (OtherProductImageLocator38)
import Types.OtherProductImageLocator48 (OtherProductImageLocator48)
import Types.OtherProductImageLocator58 (OtherProductImageLocator58)
import Types.OtherProductImageLocator68 (OtherProductImageLocator68)
import Types.OtherProductImageLocator78 (OtherProductImageLocator78)
import Types.OtherProductImageLocator88 (OtherProductImageLocator88)

data Image8 = Image8
  { mainProductImageLocator :: MainProductImageLocator8
  , otherProductImageLocator1 :: OtherProductImageLocator18
  , otherProductImageLocator2 :: OtherProductImageLocator28
  , otherProductImageLocator3 :: OtherProductImageLocator38
  , otherProductImageLocator4 :: OtherProductImageLocator48
  , otherProductImageLocator5 :: OtherProductImageLocator58
  , otherProductImageLocator6 :: OtherProductImageLocator68
  , otherProductImageLocator7 :: OtherProductImageLocator78
  , otherProductImageLocator8 :: OtherProductImageLocator88
  }
  deriving (Show, Eq)

instance FromJSON Image8 where
  parseJSON = withObject "Image8" $ \obj -> do
    mainProductImageLocator <- obj .: "main_product_image_locator"
    otherProductImageLocator1 <- obj .: "other_product_image_locator_1"
    otherProductImageLocator2 <- obj .: "other_product_image_locator_2"
    otherProductImageLocator3 <- obj .: "other_product_image_locator_3"
    otherProductImageLocator4 <- obj .: "other_product_image_locator_4"
    otherProductImageLocator5 <- obj .: "other_product_image_locator_5"
    otherProductImageLocator6 <- obj .: "other_product_image_locator_6"
    otherProductImageLocator7 <- obj .: "other_product_image_locator_7"
    otherProductImageLocator8 <- obj .: "other_product_image_locator_8"
    pure $ Image8{..}

instance ToJSON Image8 where
  toJSON Image8{..} =
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
