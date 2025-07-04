{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.DisplayAlbum where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.ChildParentSkuRelationship2 (ChildParentSkuRelationship2)
import Types.FulfillmentAvailability2 (FulfillmentAvailability2)
import Types.Height2 (Height2)
import Types.Image2 (Image2)
import Types.ItemPackageDimensions2 (ItemPackageDimensions2)
import Types.ItemPackageWeight2 (ItemPackageWeight2)
import Types.Length2 (Length2)
import Types.MainOfferImageLocator2 (MainOfferImageLocator2)
import Types.MainProductImageLocator2 (MainProductImageLocator2)
import Types.Offer2 (Offer2)
import Types.OtherOfferImageLocator12 (OtherOfferImageLocator12)
import Types.OtherOfferImageLocator22 (OtherOfferImageLocator22)
import Types.OtherOfferImageLocator32 (OtherOfferImageLocator32)
import Types.OtherOfferImageLocator42 (OtherOfferImageLocator42)
import Types.OtherOfferImageLocator52 (OtherOfferImageLocator52)
import Types.OtherProductImageLocator12 (OtherProductImageLocator12)
import Types.OtherProductImageLocator22 (OtherProductImageLocator22)
import Types.OtherProductImageLocator32 (OtherProductImageLocator32)
import Types.OtherProductImageLocator42 (OtherProductImageLocator42)
import Types.OtherProductImageLocator52 (OtherProductImageLocator52)
import Types.OtherProductImageLocator62 (OtherProductImageLocator62)
import Types.OtherProductImageLocator72 (OtherProductImageLocator72)
import Types.OtherProductImageLocator82 (OtherProductImageLocator82)
import Types.OurPrice2 (OurPrice2)
import Types.ProductDetails2 (ProductDetails2)
import Types.ProductIdentity2 (ProductIdentity2)
import Types.PurchasableOffer2 (PurchasableOffer2)
import Types.SafetyAndCompliance2 (SafetyAndCompliance2)
import Types.Schedule2 (Schedule2)
import Types.Shipping2 (Shipping2)
import Types.Type (Type)
import Types.UnitCount (UnitCount)
import Types.VariationTheme2 (VariationTheme2)
import Types.Variations2 (Variations2)
import Types.Width2 (Width2)

data DisplayAlbum = DisplayAlbum
  { image :: Image2
  , offer :: Offer2
  , productDetails :: ProductDetails2
  , productIdentity :: ProductIdentity2
  , safetyAndCompliance :: SafetyAndCompliance2
  , shipping :: Shipping2
  , variations :: Variations2
  }
  deriving (Show, Eq)

instance FromJSON DisplayAlbum where
  parseJSON = withObject "DisplayAlbum" $ \obj -> do
    image <- obj .: "image"
    offer <- obj .: "offer"
    productDetails <- obj .: "product_details"
    productIdentity <- obj .: "product_identity"
    safetyAndCompliance <- obj .: "safety_and_compliance"
    shipping <- obj .: "shipping"
    variations <- obj .: "variations"
    pure $ DisplayAlbum{..}

instance ToJSON DisplayAlbum where
  toJSON DisplayAlbum{..} =
    object [
      "image" .= image,
      "offer" .= offer,
      "product_details" .= productDetails,
      "product_identity" .= productIdentity,
      "safety_and_compliance" .= safetyAndCompliance,
      "shipping" .= shipping,
      "variations" .= variations
    ]
