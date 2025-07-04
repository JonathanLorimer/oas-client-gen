{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Offer4 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.FulfillmentAvailability4 (FulfillmentAvailability4)
import Types.MainOfferImageLocator4 (MainOfferImageLocator4)
import Types.OtherOfferImageLocator14 (OtherOfferImageLocator14)
import Types.OtherOfferImageLocator24 (OtherOfferImageLocator24)
import Types.OtherOfferImageLocator34 (OtherOfferImageLocator34)
import Types.OtherOfferImageLocator44 (OtherOfferImageLocator44)
import Types.OtherOfferImageLocator54 (OtherOfferImageLocator54)
import Types.OurPrice4 (OurPrice4)
import Types.PurchasableOffer4 (PurchasableOffer4)
import Types.Schedule4 (Schedule4)

data Offer4 = Offer4
  { conditionType :: Maybe Text
  , deprecatedOfferingStartDate :: Text
  , fulfillmentAvailability :: FulfillmentAvailability4
  , mainOfferImageLocator :: MainOfferImageLocator4
  , otherOfferImageLocator1 :: OtherOfferImageLocator14
  , otherOfferImageLocator2 :: OtherOfferImageLocator24
  , otherOfferImageLocator3 :: OtherOfferImageLocator34
  , otherOfferImageLocator4 :: OtherOfferImageLocator44
  , otherOfferImageLocator5 :: OtherOfferImageLocator54
  , purchasableOffer :: PurchasableOffer4
  }
  deriving (Show, Eq)

instance FromJSON Offer4 where
  parseJSON = withObject "Offer4" $ \obj -> do
    conditionType <- obj .: "condition_type"
    deprecatedOfferingStartDate <- obj .: "deprecated_offering_start_date"
    fulfillmentAvailability <- obj .: "fulfillment_availability"
    mainOfferImageLocator <- obj .: "main_offer_image_locator"
    otherOfferImageLocator1 <- obj .: "other_offer_image_locator_1"
    otherOfferImageLocator2 <- obj .: "other_offer_image_locator_2"
    otherOfferImageLocator3 <- obj .: "other_offer_image_locator_3"
    otherOfferImageLocator4 <- obj .: "other_offer_image_locator_4"
    otherOfferImageLocator5 <- obj .: "other_offer_image_locator_5"
    purchasableOffer <- obj .: "purchasable_offer"
    pure $ Offer4{..}

instance ToJSON Offer4 where
  toJSON Offer4{..} =
    object [
      "condition_type" .= conditionType,
      "deprecated_offering_start_date" .= deprecatedOfferingStartDate,
      "fulfillment_availability" .= fulfillmentAvailability,
      "main_offer_image_locator" .= mainOfferImageLocator,
      "other_offer_image_locator_1" .= otherOfferImageLocator1,
      "other_offer_image_locator_2" .= otherOfferImageLocator2,
      "other_offer_image_locator_3" .= otherOfferImageLocator3,
      "other_offer_image_locator_4" .= otherOfferImageLocator4,
      "other_offer_image_locator_5" .= otherOfferImageLocator5,
      "purchasable_offer" .= purchasableOffer
    ]
