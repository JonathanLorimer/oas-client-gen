{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OfficeProducts where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)

import Types.ChildParentSkuRelationship4 (ChildParentSkuRelationship4)
import Types.FulfillmentAvailability4 (FulfillmentAvailability4)
import Types.Image4 (Image4)
import Types.MainOfferImageLocator4 (MainOfferImageLocator4)
import Types.MainProductImageLocator4 (MainProductImageLocator4)
import Types.Offer4 (Offer4)
import Types.OtherOfferImageLocator14 (OtherOfferImageLocator14)
import Types.OtherOfferImageLocator24 (OtherOfferImageLocator24)
import Types.OtherOfferImageLocator34 (OtherOfferImageLocator34)
import Types.OtherOfferImageLocator44 (OtherOfferImageLocator44)
import Types.OtherOfferImageLocator54 (OtherOfferImageLocator54)
import Types.OtherProductImageLocator14 (OtherProductImageLocator14)
import Types.OtherProductImageLocator24 (OtherProductImageLocator24)
import Types.OtherProductImageLocator34 (OtherProductImageLocator34)
import Types.OtherProductImageLocator44 (OtherProductImageLocator44)
import Types.OtherProductImageLocator54 (OtherProductImageLocator54)
import Types.OtherProductImageLocator64 (OtherProductImageLocator64)
import Types.OtherProductImageLocator74 (OtherProductImageLocator74)
import Types.OtherProductImageLocator84 (OtherProductImageLocator84)
import Types.OurPrice4 (OurPrice4)
import Types.ProductDetails4 (ProductDetails4)
import Types.ProductIdentity4 (ProductIdentity4)
import Types.PurchasableOffer4 (PurchasableOffer4)
import Types.SafetyAndCompliance4 (SafetyAndCompliance4)
import Types.Schedule4 (Schedule4)
import Types.VariationTheme4 (VariationTheme4)
import Types.Variations4 (Variations4)

data OfficeProducts = OfficeProducts
  { image :: Image4
  , offer :: Offer4
  , productDetails :: ProductDetails4
  , productIdentity :: ProductIdentity4
  , safetyAndCompliance :: SafetyAndCompliance4
  , shipping :: Map Text Value
  , variations :: Variations4
  }
  deriving (Show, Eq)

instance FromJSON OfficeProducts where
  parseJSON = withObject "OfficeProducts" $ \obj -> do
    image <- obj .: "image"
    offer <- obj .: "offer"
    productDetails <- obj .: "product_details"
    productIdentity <- obj .: "product_identity"
    safetyAndCompliance <- obj .: "safety_and_compliance"
    shipping <- obj .: "shipping"
    variations <- obj .: "variations"
    pure $ OfficeProducts{..}

instance ToJSON OfficeProducts where
  toJSON OfficeProducts{..} =
    object [
      "image" .= image,
      "offer" .= offer,
      "product_details" .= productDetails,
      "product_identity" .= productIdentity,
      "safety_and_compliance" .= safetyAndCompliance,
      "shipping" .= shipping,
      "variations" .= variations
    ]
