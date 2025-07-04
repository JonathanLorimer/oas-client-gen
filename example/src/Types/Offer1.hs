{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Offer1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.FulfillmentAvailability1 (FulfillmentAvailability1)
import Types.MainOfferImageLocator1 (MainOfferImageLocator1)
import Types.OtherOfferImageLocator11 (OtherOfferImageLocator11)
import Types.OtherOfferImageLocator21 (OtherOfferImageLocator21)
import Types.OtherOfferImageLocator31 (OtherOfferImageLocator31)
import Types.OtherOfferImageLocator41 (OtherOfferImageLocator41)
import Types.OtherOfferImageLocator51 (OtherOfferImageLocator51)
import Types.OurPrice1 (OurPrice1)
import Types.PurchasableOffer1 (PurchasableOffer1)
import Types.Schedule1 (Schedule1)

data Offer1 = Offer1
  { conditionType :: Maybe Text
  , fulfillmentAvailability :: FulfillmentAvailability1
  , mainOfferImageLocator :: MainOfferImageLocator1
  , otherOfferImageLocator1 :: OtherOfferImageLocator11
  , otherOfferImageLocator2 :: OtherOfferImageLocator21
  , otherOfferImageLocator3 :: OtherOfferImageLocator31
  , otherOfferImageLocator4 :: OtherOfferImageLocator41
  , otherOfferImageLocator5 :: OtherOfferImageLocator51
  , purchasableOffer :: PurchasableOffer1
  }
  deriving (Show, Eq)

instance FromJSON Offer1 where
  parseJSON = withObject "Offer1" $ \obj -> do
    conditionType <- obj .: "condition_type"
    fulfillmentAvailability <- obj .: "fulfillment_availability"
    mainOfferImageLocator <- obj .: "main_offer_image_locator"
    otherOfferImageLocator1 <- obj .: "other_offer_image_locator_1"
    otherOfferImageLocator2 <- obj .: "other_offer_image_locator_2"
    otherOfferImageLocator3 <- obj .: "other_offer_image_locator_3"
    otherOfferImageLocator4 <- obj .: "other_offer_image_locator_4"
    otherOfferImageLocator5 <- obj .: "other_offer_image_locator_5"
    purchasableOffer <- obj .: "purchasable_offer"
    pure $ Offer1{..}

instance ToJSON Offer1 where
  toJSON Offer1{..} =
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
