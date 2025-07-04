{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ToteBag where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.Capacity2 (Capacity2)
import Types.ChildParentSkuRelationship7 (ChildParentSkuRelationship7)
import Types.Closure1 (Closure1)
import Types.FulfillmentAvailability7 (FulfillmentAvailability7)
import Types.Height10 (Height10)
import Types.Height9 (Height9)
import Types.Image7 (Image7)
import Types.ItemLengthWidthHeight1 (ItemLengthWidthHeight1)
import Types.ItemPackageDimensions6 (ItemPackageDimensions6)
import Types.ItemPackageWeight6 (ItemPackageWeight6)
import Types.Length8 (Length8)
import Types.Length9 (Length9)
import Types.MainOfferImageLocator7 (MainOfferImageLocator7)
import Types.MainProductImageLocator7 (MainProductImageLocator7)
import Types.Offer7 (Offer7)
import Types.OtherOfferImageLocator17 (OtherOfferImageLocator17)
import Types.OtherOfferImageLocator27 (OtherOfferImageLocator27)
import Types.OtherOfferImageLocator37 (OtherOfferImageLocator37)
import Types.OtherOfferImageLocator47 (OtherOfferImageLocator47)
import Types.OtherOfferImageLocator57 (OtherOfferImageLocator57)
import Types.OtherProductImageLocator17 (OtherProductImageLocator17)
import Types.OtherProductImageLocator27 (OtherProductImageLocator27)
import Types.OtherProductImageLocator37 (OtherProductImageLocator37)
import Types.OtherProductImageLocator47 (OtherProductImageLocator47)
import Types.OtherProductImageLocator57 (OtherProductImageLocator57)
import Types.OtherProductImageLocator67 (OtherProductImageLocator67)
import Types.OtherProductImageLocator77 (OtherProductImageLocator77)
import Types.OtherProductImageLocator87 (OtherProductImageLocator87)
import Types.OurPrice7 (OurPrice7)
import Types.ProductDetails7 (ProductDetails7)
import Types.ProductIdentity7 (ProductIdentity7)
import Types.PurchasableOffer7 (PurchasableOffer7)
import Types.SafetyAndCompliance7 (SafetyAndCompliance7)
import Types.Schedule7 (Schedule7)
import Types.Shipping6 (Shipping6)
import Types.Type7 (Type7)
import Types.VariationTheme7 (VariationTheme7)
import Types.Variations7 (Variations7)
import Types.Width10 (Width10)
import Types.Width11 (Width11)

data ToteBag = ToteBag
  { image :: Image7
  , offer :: Offer7
  , productDetails :: ProductDetails7
  , productIdentity :: ProductIdentity7
  , safetyAndCompliance :: SafetyAndCompliance7
  , shipping :: Shipping6
  , variations :: Variations7
  }
  deriving (Show, Eq)

instance FromJSON ToteBag where
  parseJSON = withObject "ToteBag" $ \obj -> do
    image <- obj .: "image"
    offer <- obj .: "offer"
    productDetails <- obj .: "product_details"
    productIdentity <- obj .: "product_identity"
    safetyAndCompliance <- obj .: "safety_and_compliance"
    shipping <- obj .: "shipping"
    variations <- obj .: "variations"
    pure $ ToteBag{..}

instance ToJSON ToteBag where
  toJSON ToteBag{..} =
    object [
      "image" .= image,
      "offer" .= offer,
      "product_details" .= productDetails,
      "product_identity" .= productIdentity,
      "safety_and_compliance" .= safetyAndCompliance,
      "shipping" .= shipping,
      "variations" .= variations
    ]
