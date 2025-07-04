{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Offer3 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.FulfillmentAvailability3 (FulfillmentAvailability3)
import Types.MainOfferImageLocator3 (MainOfferImageLocator3)
import Types.OtherOfferImageLocator13 (OtherOfferImageLocator13)
import Types.OtherOfferImageLocator23 (OtherOfferImageLocator23)
import Types.OtherOfferImageLocator33 (OtherOfferImageLocator33)
import Types.OtherOfferImageLocator43 (OtherOfferImageLocator43)
import Types.OtherOfferImageLocator53 (OtherOfferImageLocator53)
import Types.OurPrice3 (OurPrice3)
import Types.PurchasableOffer3 (PurchasableOffer3)
import Types.Schedule3 (Schedule3)

data Offer3 = Offer3
  { conditionType :: Maybe Text
  , fulfillmentAvailability :: FulfillmentAvailability3
  , mainOfferImageLocator :: MainOfferImageLocator3
  , otherOfferImageLocator1 :: OtherOfferImageLocator13
  , otherOfferImageLocator2 :: OtherOfferImageLocator23
  , otherOfferImageLocator3 :: OtherOfferImageLocator33
  , otherOfferImageLocator4 :: OtherOfferImageLocator43
  , otherOfferImageLocator5 :: OtherOfferImageLocator53
  , purchasableOffer :: PurchasableOffer3
  }
  deriving (Show, Eq)

instance FromJSON Offer3 where
  parseJSON = withObject "Offer3" $ \obj -> do
    conditionType <- obj .: "condition_type"
    fulfillmentAvailability <- obj .: "fulfillment_availability"
    mainOfferImageLocator <- obj .: "main_offer_image_locator"
    otherOfferImageLocator1 <- obj .: "other_offer_image_locator_1"
    otherOfferImageLocator2 <- obj .: "other_offer_image_locator_2"
    otherOfferImageLocator3 <- obj .: "other_offer_image_locator_3"
    otherOfferImageLocator4 <- obj .: "other_offer_image_locator_4"
    otherOfferImageLocator5 <- obj .: "other_offer_image_locator_5"
    purchasableOffer <- obj .: "purchasable_offer"
    pure $ Offer3{..}

instance ToJSON Offer3 where
  toJSON Offer3{..} =
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
