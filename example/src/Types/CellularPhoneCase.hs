{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CellularPhoneCase where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.ChildParentSkuRelationship (ChildParentSkuRelationship)
import Types.FulfillmentAvailability (FulfillmentAvailability)
import Types.Height (Height)
import Types.Image (Image)
import Types.ItemPackageDimensions (ItemPackageDimensions)
import Types.ItemPackageWeight (ItemPackageWeight)
import Types.Length (Length)
import Types.MainOfferImageLocator (MainOfferImageLocator)
import Types.MainProductImageLocator (MainProductImageLocator)
import Types.Offer (Offer)
import Types.OtherOfferImageLocator1 (OtherOfferImageLocator1)
import Types.OtherOfferImageLocator2 (OtherOfferImageLocator2)
import Types.OtherOfferImageLocator3 (OtherOfferImageLocator3)
import Types.OtherOfferImageLocator4 (OtherOfferImageLocator4)
import Types.OtherOfferImageLocator5 (OtherOfferImageLocator5)
import Types.OtherProductImageLocator1 (OtherProductImageLocator1)
import Types.OtherProductImageLocator2 (OtherProductImageLocator2)
import Types.OtherProductImageLocator3 (OtherProductImageLocator3)
import Types.OtherProductImageLocator4 (OtherProductImageLocator4)
import Types.OtherProductImageLocator5 (OtherProductImageLocator5)
import Types.OtherProductImageLocator6 (OtherProductImageLocator6)
import Types.OtherProductImageLocator7 (OtherProductImageLocator7)
import Types.OtherProductImageLocator8 (OtherProductImageLocator8)
import Types.OurPrice (OurPrice)
import Types.ProductDetails (ProductDetails)
import Types.ProductIdentity (ProductIdentity)
import Types.PurchasableOffer (PurchasableOffer)
import Types.SafetyAndCompliance (SafetyAndCompliance)
import Types.Schedule (Schedule)
import Types.Shipping (Shipping)
import Types.VariationTheme (VariationTheme)
import Types.Variations (Variations)
import Types.Width (Width)

data CellularPhoneCase = CellularPhoneCase
  { image :: Image
  , offer :: Offer
  , productDetails :: ProductDetails
  , productIdentity :: ProductIdentity
  , safetyAndCompliance :: SafetyAndCompliance
  , shipping :: Shipping
  , variations :: Variations
  }
  deriving (Show, Eq)

instance FromJSON CellularPhoneCase where
  parseJSON = withObject "CellularPhoneCase" $ \obj -> do
    image <- obj .: "image"
    offer <- obj .: "offer"
    productDetails <- obj .: "product_details"
    productIdentity <- obj .: "product_identity"
    safetyAndCompliance <- obj .: "safety_and_compliance"
    shipping <- obj .: "shipping"
    variations <- obj .: "variations"
    pure $ CellularPhoneCase{..}

instance ToJSON CellularPhoneCase where
  toJSON CellularPhoneCase{..} =
    object [
      "image" .= image,
      "offer" .= offer,
      "product_details" .= productDetails,
      "product_identity" .= productIdentity,
      "safety_and_compliance" .= safetyAndCompliance,
      "shipping" .= shipping,
      "variations" .= variations
    ]
