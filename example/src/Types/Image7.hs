{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Image7 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.MainProductImageLocator7 (MainProductImageLocator7)
import Types.OtherProductImageLocator17 (OtherProductImageLocator17)
import Types.OtherProductImageLocator27 (OtherProductImageLocator27)
import Types.OtherProductImageLocator37 (OtherProductImageLocator37)
import Types.OtherProductImageLocator47 (OtherProductImageLocator47)
import Types.OtherProductImageLocator57 (OtherProductImageLocator57)
import Types.OtherProductImageLocator67 (OtherProductImageLocator67)
import Types.OtherProductImageLocator77 (OtherProductImageLocator77)
import Types.OtherProductImageLocator87 (OtherProductImageLocator87)

data Image7 = Image7
  { mainProductImageLocator :: MainProductImageLocator7
  , otherProductImageLocator1 :: OtherProductImageLocator17
  , otherProductImageLocator2 :: OtherProductImageLocator27
  , otherProductImageLocator3 :: OtherProductImageLocator37
  , otherProductImageLocator4 :: OtherProductImageLocator47
  , otherProductImageLocator5 :: OtherProductImageLocator57
  , otherProductImageLocator6 :: OtherProductImageLocator67
  , otherProductImageLocator7 :: OtherProductImageLocator77
  , otherProductImageLocator8 :: OtherProductImageLocator87
  }
  deriving (Show, Eq)

instance FromJSON Image7 where
  parseJSON = withObject "Image7" $ \obj -> do
    mainProductImageLocator <- obj .: "main_product_image_locator"
    otherProductImageLocator1 <- obj .: "other_product_image_locator_1"
    otherProductImageLocator2 <- obj .: "other_product_image_locator_2"
    otherProductImageLocator3 <- obj .: "other_product_image_locator_3"
    otherProductImageLocator4 <- obj .: "other_product_image_locator_4"
    otherProductImageLocator5 <- obj .: "other_product_image_locator_5"
    otherProductImageLocator6 <- obj .: "other_product_image_locator_6"
    otherProductImageLocator7 <- obj .: "other_product_image_locator_7"
    otherProductImageLocator8 <- obj .: "other_product_image_locator_8"
    pure $ Image7{..}

instance ToJSON Image7 where
  toJSON Image7{..} =
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
