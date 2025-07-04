{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.DecorativeCutout where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.ChildParentSkuRelationship1 (ChildParentSkuRelationship1)
import Types.FulfillmentAvailability1 (FulfillmentAvailability1)
import Types.Height1 (Height1)
import Types.Image1 (Image1)
import Types.ItemPackageDimensions1 (ItemPackageDimensions1)
import Types.ItemPackageWeight1 (ItemPackageWeight1)
import Types.Length1 (Length1)
import Types.MainOfferImageLocator1 (MainOfferImageLocator1)
import Types.MainProductImageLocator1 (MainProductImageLocator1)
import Types.Offer1 (Offer1)
import Types.OtherOfferImageLocator11 (OtherOfferImageLocator11)
import Types.OtherOfferImageLocator21 (OtherOfferImageLocator21)
import Types.OtherOfferImageLocator31 (OtherOfferImageLocator31)
import Types.OtherOfferImageLocator41 (OtherOfferImageLocator41)
import Types.OtherOfferImageLocator51 (OtherOfferImageLocator51)
import Types.OtherProductImageLocator11 (OtherProductImageLocator11)
import Types.OtherProductImageLocator21 (OtherProductImageLocator21)
import Types.OtherProductImageLocator31 (OtherProductImageLocator31)
import Types.OtherProductImageLocator41 (OtherProductImageLocator41)
import Types.OtherProductImageLocator51 (OtherProductImageLocator51)
import Types.OtherProductImageLocator61 (OtherProductImageLocator61)
import Types.OtherProductImageLocator71 (OtherProductImageLocator71)
import Types.OtherProductImageLocator81 (OtherProductImageLocator81)
import Types.OurPrice1 (OurPrice1)
import Types.ProductDetails1 (ProductDetails1)
import Types.ProductIdentity1 (ProductIdentity1)
import Types.PurchasableOffer1 (PurchasableOffer1)
import Types.SafetyAndCompliance1 (SafetyAndCompliance1)
import Types.Schedule1 (Schedule1)
import Types.Shipping1 (Shipping1)
import Types.VariationTheme1 (VariationTheme1)
import Types.Variations1 (Variations1)
import Types.Width1 (Width1)

data DecorativeCutout = DecorativeCutout
  { image :: Image1
  , offer :: Offer1
  , productDetails :: ProductDetails1
  , productIdentity :: ProductIdentity1
  , safetyAndCompliance :: SafetyAndCompliance1
  , shipping :: Shipping1
  , variations :: Variations1
  }
  deriving (Show, Eq)

instance FromJSON DecorativeCutout where
  parseJSON = withObject "DecorativeCutout" $ \obj -> do
    image <- obj .: "image"
    offer <- obj .: "offer"
    productDetails <- obj .: "product_details"
    productIdentity <- obj .: "product_identity"
    safetyAndCompliance <- obj .: "safety_and_compliance"
    shipping <- obj .: "shipping"
    variations <- obj .: "variations"
    pure $ DecorativeCutout{..}

instance ToJSON DecorativeCutout where
  toJSON DecorativeCutout{..} =
    object [
      "image" .= image,
      "offer" .= offer,
      "product_details" .= productDetails,
      "product_identity" .= productIdentity,
      "safety_and_compliance" .= safetyAndCompliance,
      "shipping" .= shipping,
      "variations" .= variations
    ]
