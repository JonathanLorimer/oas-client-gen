{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Offer where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.FulfillmentAvailability (FulfillmentAvailability)
import Types.MainOfferImageLocator (MainOfferImageLocator)
import Types.OtherOfferImageLocator1 (OtherOfferImageLocator1)
import Types.OtherOfferImageLocator2 (OtherOfferImageLocator2)
import Types.OtherOfferImageLocator3 (OtherOfferImageLocator3)
import Types.OtherOfferImageLocator4 (OtherOfferImageLocator4)
import Types.OtherOfferImageLocator5 (OtherOfferImageLocator5)
import Types.OurPrice (OurPrice)
import Types.PurchasableOffer (PurchasableOffer)
import Types.Schedule (Schedule)

data Offer = Offer
  { conditionType :: Maybe Text
  , fulfillmentAvailability :: FulfillmentAvailability
  , mainOfferImageLocator :: MainOfferImageLocator
  , otherOfferImageLocator1 :: OtherOfferImageLocator1
  , otherOfferImageLocator2 :: OtherOfferImageLocator2
  , otherOfferImageLocator3 :: OtherOfferImageLocator3
  , otherOfferImageLocator4 :: OtherOfferImageLocator4
  , otherOfferImageLocator5 :: OtherOfferImageLocator5
  , purchasableOffer :: PurchasableOffer
  }
  deriving (Show, Eq)

instance FromJSON Offer where
  parseJSON = withObject "Offer" $ \obj -> do
    conditionType <- obj .: "condition_type"
    fulfillmentAvailability <- obj .: "fulfillment_availability"
    mainOfferImageLocator <- obj .: "main_offer_image_locator"
    otherOfferImageLocator1 <- obj .: "other_offer_image_locator_1"
    otherOfferImageLocator2 <- obj .: "other_offer_image_locator_2"
    otherOfferImageLocator3 <- obj .: "other_offer_image_locator_3"
    otherOfferImageLocator4 <- obj .: "other_offer_image_locator_4"
    otherOfferImageLocator5 <- obj .: "other_offer_image_locator_5"
    purchasableOffer <- obj .: "purchasable_offer"
    pure $ Offer{..}

instance ToJSON Offer where
  toJSON Offer{..} =
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
