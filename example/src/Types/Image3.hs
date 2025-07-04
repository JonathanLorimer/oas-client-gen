{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Image3 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.MainProductImageLocator3 (MainProductImageLocator3)
import Types.OtherProductImageLocator13 (OtherProductImageLocator13)
import Types.OtherProductImageLocator23 (OtherProductImageLocator23)
import Types.OtherProductImageLocator33 (OtherProductImageLocator33)
import Types.OtherProductImageLocator43 (OtherProductImageLocator43)
import Types.OtherProductImageLocator53 (OtherProductImageLocator53)
import Types.OtherProductImageLocator63 (OtherProductImageLocator63)
import Types.OtherProductImageLocator73 (OtherProductImageLocator73)
import Types.OtherProductImageLocator83 (OtherProductImageLocator83)

data Image3 = Image3
  { mainProductImageLocator :: MainProductImageLocator3
  , otherProductImageLocator1 :: OtherProductImageLocator13
  , otherProductImageLocator2 :: OtherProductImageLocator23
  , otherProductImageLocator3 :: OtherProductImageLocator33
  , otherProductImageLocator4 :: OtherProductImageLocator43
  , otherProductImageLocator5 :: OtherProductImageLocator53
  , otherProductImageLocator6 :: OtherProductImageLocator63
  , otherProductImageLocator7 :: OtherProductImageLocator73
  , otherProductImageLocator8 :: OtherProductImageLocator83
  }
  deriving (Show, Eq)

instance FromJSON Image3 where
  parseJSON = withObject "Image3" $ \obj -> do
    mainProductImageLocator <- obj .: "main_product_image_locator"
    otherProductImageLocator1 <- obj .: "other_product_image_locator_1"
    otherProductImageLocator2 <- obj .: "other_product_image_locator_2"
    otherProductImageLocator3 <- obj .: "other_product_image_locator_3"
    otherProductImageLocator4 <- obj .: "other_product_image_locator_4"
    otherProductImageLocator5 <- obj .: "other_product_image_locator_5"
    otherProductImageLocator6 <- obj .: "other_product_image_locator_6"
    otherProductImageLocator7 <- obj .: "other_product_image_locator_7"
    otherProductImageLocator8 <- obj .: "other_product_image_locator_8"
    pure $ Image3{..}

instance ToJSON Image3 where
  toJSON Image3{..} =
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
