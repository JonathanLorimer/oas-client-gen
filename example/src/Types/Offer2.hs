{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Offer2 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.FulfillmentAvailability2 (FulfillmentAvailability2)
import Types.MainOfferImageLocator2 (MainOfferImageLocator2)
import Types.OtherOfferImageLocator12 (OtherOfferImageLocator12)
import Types.OtherOfferImageLocator22 (OtherOfferImageLocator22)
import Types.OtherOfferImageLocator32 (OtherOfferImageLocator32)
import Types.OtherOfferImageLocator42 (OtherOfferImageLocator42)
import Types.OtherOfferImageLocator52 (OtherOfferImageLocator52)
import Types.OurPrice2 (OurPrice2)
import Types.PurchasableOffer2 (PurchasableOffer2)
import Types.Schedule2 (Schedule2)

data Offer2 = Offer2
  { conditionType :: Maybe Text
  , fulfillmentAvailability :: FulfillmentAvailability2
  , mainOfferImageLocator :: MainOfferImageLocator2
  , otherOfferImageLocator1 :: OtherOfferImageLocator12
  , otherOfferImageLocator2 :: OtherOfferImageLocator22
  , otherOfferImageLocator3 :: OtherOfferImageLocator32
  , otherOfferImageLocator4 :: OtherOfferImageLocator42
  , otherOfferImageLocator5 :: OtherOfferImageLocator52
  , purchasableOffer :: PurchasableOffer2
  }
  deriving (Show, Eq)

instance FromJSON Offer2 where
  parseJSON = withObject "Offer2" $ \obj -> do
    conditionType <- obj .: "condition_type"
    fulfillmentAvailability <- obj .: "fulfillment_availability"
    mainOfferImageLocator <- obj .: "main_offer_image_locator"
    otherOfferImageLocator1 <- obj .: "other_offer_image_locator_1"
    otherOfferImageLocator2 <- obj .: "other_offer_image_locator_2"
    otherOfferImageLocator3 <- obj .: "other_offer_image_locator_3"
    otherOfferImageLocator4 <- obj .: "other_offer_image_locator_4"
    otherOfferImageLocator5 <- obj .: "other_offer_image_locator_5"
    purchasableOffer <- obj .: "purchasable_offer"
    pure $ Offer2{..}

instance ToJSON Offer2 where
  toJSON Offer2{..} =
    object [
      "condition_type" .= conditionType,
      "fulfillment_availability" .= fulfillmentAvailability,
      "main_offer_image_locator" .= mainOfferImageLocator,
      "other_offer_image_locator_1" .= otherOfferImageLocator1,
      "other_offer_image_locator_2" .= otherOfferImageLocator2,
      "other_offer_image_locator_3" .= otherOfferImageLocator3,
      "other_offer_image_locator_4" .= otherOfferImageLocator4,
      "other_offer_image_locator_5" .= otherOfferImageLocator5,
      "purchasable_offer" .= purchasableOffer
    ]
