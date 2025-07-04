{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Sweatshirt where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.ApparelSize (ApparelSize)
import Types.Capacity1 (Capacity1)
import Types.ChildParentSkuRelationship6 (ChildParentSkuRelationship6)
import Types.Closure (Closure)
import Types.CuffStyle1 (CuffStyle1)
import Types.Frame (Frame)
import Types.FulfillmentAvailability6 (FulfillmentAvailability6)
import Types.Height6 (Height6)
import Types.Height7 (Height7)
import Types.Height8 (Height8)
import Types.Image6 (Image6)
import Types.ItemLengthWidth (ItemLengthWidth)
import Types.ItemLengthWidthHeight (ItemLengthWidthHeight)
import Types.ItemPackageDimensions5 (ItemPackageDimensions5)
import Types.ItemPackageWeight5 (ItemPackageWeight5)
import Types.ItemWidthHeight1 (ItemWidthHeight1)
import Types.Length5 (Length5)
import Types.Length6 (Length6)
import Types.Length7 (Length7)
import Types.MainOfferImageLocator6 (MainOfferImageLocator6)
import Types.MainProductImageLocator6 (MainProductImageLocator6)
import Types.Material (Material)
import Types.Neck1 (Neck1)
import Types.NeckStyle1 (NeckStyle1)
import Types.Offer6 (Offer6)
import Types.OtherOfferImageLocator16 (OtherOfferImageLocator16)
import Types.OtherOfferImageLocator26 (OtherOfferImageLocator26)
import Types.OtherOfferImageLocator36 (OtherOfferImageLocator36)
import Types.OtherOfferImageLocator46 (OtherOfferImageLocator46)
import Types.OtherOfferImageLocator56 (OtherOfferImageLocator56)
import Types.OtherProductImageLocator16 (OtherProductImageLocator16)
import Types.OtherProductImageLocator26 (OtherProductImageLocator26)
import Types.OtherProductImageLocator36 (OtherProductImageLocator36)
import Types.OtherProductImageLocator46 (OtherProductImageLocator46)
import Types.OtherProductImageLocator56 (OtherProductImageLocator56)
import Types.OtherProductImageLocator66 (OtherProductImageLocator66)
import Types.OtherProductImageLocator76 (OtherProductImageLocator76)
import Types.OtherProductImageLocator86 (OtherProductImageLocator86)
import Types.OurPrice6 (OurPrice6)
import Types.ProductDetails6 (ProductDetails6)
import Types.ProductIdentity6 (ProductIdentity6)
import Types.PurchasableOffer6 (PurchasableOffer6)
import Types.SafetyAndCompliance6 (SafetyAndCompliance6)
import Types.Schedule6 (Schedule6)
import Types.Shipping5 (Shipping5)
import Types.ShirtSize1 (ShirtSize1)
import Types.Sleeve1 (Sleeve1)
import Types.Type3 (Type3)
import Types.Type4 (Type4)
import Types.Type5 (Type5)
import Types.Type6 (Type6)
import Types.UnitCount2 (UnitCount2)
import Types.VariationTheme6 (VariationTheme6)
import Types.Variations6 (Variations6)
import Types.Width6 (Width6)
import Types.Width7 (Width7)
import Types.Width8 (Width8)
import Types.Width9 (Width9)

data Sweatshirt = Sweatshirt
  { image :: Image6
  , offer :: Offer6
  , productDetails :: ProductDetails6
  , productIdentity :: ProductIdentity6
  , safetyAndCompliance :: SafetyAndCompliance6
  , shipping :: Shipping5
  , variations :: Variations6
  }
  deriving (Show, Eq)

instance FromJSON Sweatshirt where
  parseJSON = withObject "Sweatshirt" $ \obj -> do
    image <- obj .: "image"
    offer <- obj .: "offer"
    productDetails <- obj .: "product_details"
    productIdentity <- obj .: "product_identity"
    safetyAndCompliance <- obj .: "safety_and_compliance"
    shipping <- obj .: "shipping"
    variations <- obj .: "variations"
    pure $ Sweatshirt{..}

instance ToJSON Sweatshirt where
  toJSON Sweatshirt{..} =
    object [
      "image" .= image,
      "offer" .= offer,
      "product_details" .= productDetails,
      "product_identity" .= productIdentity,
      "safety_and_compliance" .= safetyAndCompliance,
      "shipping" .= shipping,
      "variations" .= variations
    ]
