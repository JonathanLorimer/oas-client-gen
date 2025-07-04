{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.WallArt where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.ChildParentSkuRelationship8 (ChildParentSkuRelationship8)
import Types.Frame1 (Frame1)
import Types.FulfillmentAvailability8 (FulfillmentAvailability8)
import Types.Height11 (Height11)
import Types.Image8 (Image8)
import Types.ItemLengthWidth1 (ItemLengthWidth1)
import Types.ItemPackageDimensions7 (ItemPackageDimensions7)
import Types.ItemPackageWeight7 (ItemPackageWeight7)
import Types.Length10 (Length10)
import Types.Length11 (Length11)
import Types.MainOfferImageLocator8 (MainOfferImageLocator8)
import Types.MainProductImageLocator8 (MainProductImageLocator8)
import Types.Material1 (Material1)
import Types.Offer8 (Offer8)
import Types.OtherOfferImageLocator18 (OtherOfferImageLocator18)
import Types.OtherOfferImageLocator28 (OtherOfferImageLocator28)
import Types.OtherOfferImageLocator38 (OtherOfferImageLocator38)
import Types.OtherOfferImageLocator48 (OtherOfferImageLocator48)
import Types.OtherOfferImageLocator58 (OtherOfferImageLocator58)
import Types.OtherProductImageLocator18 (OtherProductImageLocator18)
import Types.OtherProductImageLocator28 (OtherProductImageLocator28)
import Types.OtherProductImageLocator38 (OtherProductImageLocator38)
import Types.OtherProductImageLocator48 (OtherProductImageLocator48)
import Types.OtherProductImageLocator58 (OtherProductImageLocator58)
import Types.OtherProductImageLocator68 (OtherProductImageLocator68)
import Types.OtherProductImageLocator78 (OtherProductImageLocator78)
import Types.OtherProductImageLocator88 (OtherProductImageLocator88)
import Types.OurPrice8 (OurPrice8)
import Types.ProductDetails8 (ProductDetails8)
import Types.ProductIdentity8 (ProductIdentity8)
import Types.PurchasableOffer8 (PurchasableOffer8)
import Types.SafetyAndCompliance8 (SafetyAndCompliance8)
import Types.Schedule8 (Schedule8)
import Types.Shipping7 (Shipping7)
import Types.Type8 (Type8)
import Types.VariationTheme8 (VariationTheme8)
import Types.Variations8 (Variations8)
import Types.Width12 (Width12)
import Types.Width13 (Width13)

data WallArt = WallArt
  { image :: Image8
  , offer :: Offer8
  , productDetails :: ProductDetails8
  , productIdentity :: ProductIdentity8
  , safetyAndCompliance :: SafetyAndCompliance8
  , shipping :: Shipping7
  , variations :: Variations8
  }
  deriving (Show, Eq)

instance FromJSON WallArt where
  parseJSON = withObject "WallArt" $ \obj -> do
    image <- obj .: "image"
    offer <- obj .: "offer"
    productDetails <- obj .: "product_details"
    productIdentity <- obj .: "product_identity"
    safetyAndCompliance <- obj .: "safety_and_compliance"
    shipping <- obj .: "shipping"
    variations <- obj .: "variations"
    pure $ WallArt{..}

instance ToJSON WallArt where
  toJSON WallArt{..} =
    object [
      "image" .= image,
      "offer" .= offer,
      "product_details" .= productDetails,
      "product_identity" .= productIdentity,
      "safety_and_compliance" .= safetyAndCompliance,
      "shipping" .= shipping,
      "variations" .= variations
    ]
