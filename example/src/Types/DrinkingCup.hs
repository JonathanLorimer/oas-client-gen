{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.DrinkingCup where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.Capacity (Capacity)
import Types.ChildParentSkuRelationship3 (ChildParentSkuRelationship3)
import Types.FulfillmentAvailability3 (FulfillmentAvailability3)
import Types.Height3 (Height3)
import Types.Height4 (Height4)
import Types.Image3 (Image3)
import Types.ItemPackageDimensions3 (ItemPackageDimensions3)
import Types.ItemPackageWeight3 (ItemPackageWeight3)
import Types.ItemWidthHeight (ItemWidthHeight)
import Types.Length3 (Length3)
import Types.MainOfferImageLocator3 (MainOfferImageLocator3)
import Types.MainProductImageLocator3 (MainProductImageLocator3)
import Types.Offer3 (Offer3)
import Types.OtherOfferImageLocator13 (OtherOfferImageLocator13)
import Types.OtherOfferImageLocator23 (OtherOfferImageLocator23)
import Types.OtherOfferImageLocator33 (OtherOfferImageLocator33)
import Types.OtherOfferImageLocator43 (OtherOfferImageLocator43)
import Types.OtherOfferImageLocator53 (OtherOfferImageLocator53)
import Types.OtherProductImageLocator13 (OtherProductImageLocator13)
import Types.OtherProductImageLocator23 (OtherProductImageLocator23)
import Types.OtherProductImageLocator33 (OtherProductImageLocator33)
import Types.OtherProductImageLocator43 (OtherProductImageLocator43)
import Types.OtherProductImageLocator53 (OtherProductImageLocator53)
import Types.OtherProductImageLocator63 (OtherProductImageLocator63)
import Types.OtherProductImageLocator73 (OtherProductImageLocator73)
import Types.OtherProductImageLocator83 (OtherProductImageLocator83)
import Types.OurPrice3 (OurPrice3)
import Types.ProductDetails3 (ProductDetails3)
import Types.ProductIdentity3 (ProductIdentity3)
import Types.PurchasableOffer3 (PurchasableOffer3)
import Types.SafetyAndCompliance3 (SafetyAndCompliance3)
import Types.Schedule3 (Schedule3)
import Types.Shipping3 (Shipping3)
import Types.Type1 (Type1)
import Types.UnitCount1 (UnitCount1)
import Types.VariationTheme3 (VariationTheme3)
import Types.Variations3 (Variations3)
import Types.Width3 (Width3)
import Types.Width4 (Width4)

data DrinkingCup = DrinkingCup
  { image :: Image3
  , offer :: Offer3
  , productDetails :: ProductDetails3
  , productIdentity :: ProductIdentity3
  , safetyAndCompliance :: SafetyAndCompliance3
  , shipping :: Shipping3
  , variations :: Variations3
  }
  deriving (Show, Eq)

instance FromJSON DrinkingCup where
  parseJSON = withObject "DrinkingCup" $ \obj -> do
    image <- obj .: "image"
    offer <- obj .: "offer"
    productDetails <- obj .: "product_details"
    productIdentity <- obj .: "product_identity"
    safetyAndCompliance <- obj .: "safety_and_compliance"
    shipping <- obj .: "shipping"
    variations <- obj .: "variations"
    pure $ DrinkingCup{..}

instance ToJSON DrinkingCup where
  toJSON DrinkingCup{..} =
    object [
      "image" .= image,
      "offer" .= offer,
      "product_details" .= productDetails,
      "product_identity" .= productIdentity,
      "safety_and_compliance" .= safetyAndCompliance,
      "shipping" .= shipping,
      "variations" .= variations
    ]
