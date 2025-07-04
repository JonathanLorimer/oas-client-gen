{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Shirt where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.ChildParentSkuRelationship5 (ChildParentSkuRelationship5)
import Types.CuffStyle (CuffStyle)
import Types.FulfillmentAvailability5 (FulfillmentAvailability5)
import Types.Height5 (Height5)
import Types.Image5 (Image5)
import Types.ItemPackageDimensions4 (ItemPackageDimensions4)
import Types.ItemPackageWeight4 (ItemPackageWeight4)
import Types.Length4 (Length4)
import Types.MainOfferImageLocator5 (MainOfferImageLocator5)
import Types.MainProductImageLocator5 (MainProductImageLocator5)
import Types.Neck (Neck)
import Types.NeckStyle (NeckStyle)
import Types.Offer5 (Offer5)
import Types.OtherOfferImageLocator15 (OtherOfferImageLocator15)
import Types.OtherOfferImageLocator25 (OtherOfferImageLocator25)
import Types.OtherOfferImageLocator35 (OtherOfferImageLocator35)
import Types.OtherOfferImageLocator45 (OtherOfferImageLocator45)
import Types.OtherOfferImageLocator55 (OtherOfferImageLocator55)
import Types.OtherProductImageLocator15 (OtherProductImageLocator15)
import Types.OtherProductImageLocator25 (OtherProductImageLocator25)
import Types.OtherProductImageLocator35 (OtherProductImageLocator35)
import Types.OtherProductImageLocator45 (OtherProductImageLocator45)
import Types.OtherProductImageLocator55 (OtherProductImageLocator55)
import Types.OtherProductImageLocator65 (OtherProductImageLocator65)
import Types.OtherProductImageLocator75 (OtherProductImageLocator75)
import Types.OtherProductImageLocator85 (OtherProductImageLocator85)
import Types.OurPrice5 (OurPrice5)
import Types.ProductDetails5 (ProductDetails5)
import Types.ProductIdentity5 (ProductIdentity5)
import Types.PurchasableOffer5 (PurchasableOffer5)
import Types.SafetyAndCompliance5 (SafetyAndCompliance5)
import Types.Schedule5 (Schedule5)
import Types.Shipping4 (Shipping4)
import Types.ShirtSize (ShirtSize)
import Types.Sleeve (Sleeve)
import Types.Type2 (Type2)
import Types.VariationTheme5 (VariationTheme5)
import Types.Variations5 (Variations5)
import Types.Width5 (Width5)

data Shirt = Shirt
  { image :: Image5
  , offer :: Offer5
  , productDetails :: ProductDetails5
  , productIdentity :: ProductIdentity5
  , safetyAndCompliance :: SafetyAndCompliance5
  , shipping :: Shipping4
  , variations :: Variations5
  }
  deriving (Show, Eq)

instance FromJSON Shirt where
  parseJSON = withObject "Shirt" $ \obj -> do
    image <- obj .: "image"
    offer <- obj .: "offer"
    productDetails <- obj .: "product_details"
    productIdentity <- obj .: "product_identity"
    safetyAndCompliance <- obj .: "safety_and_compliance"
    shipping <- obj .: "shipping"
    variations <- obj .: "variations"
    pure $ Shirt{..}

instance ToJSON Shirt where
  toJSON Shirt{..} =
    object [
      "image" .= image,
      "offer" .= offer,
      "product_details" .= productDetails,
      "product_identity" .= productIdentity,
      "safety_and_compliance" .= safetyAndCompliance,
      "shipping" .= shipping,
      "variations" .= variations
    ]
