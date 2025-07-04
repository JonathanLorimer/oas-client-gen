{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Offer6 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.FulfillmentAvailability6 (FulfillmentAvailability6)
import Types.MainOfferImageLocator6 (MainOfferImageLocator6)
import Types.OtherOfferImageLocator16 (OtherOfferImageLocator16)
import Types.OtherOfferImageLocator26 (OtherOfferImageLocator26)
import Types.OtherOfferImageLocator36 (OtherOfferImageLocator36)
import Types.OtherOfferImageLocator46 (OtherOfferImageLocator46)
import Types.OtherOfferImageLocator56 (OtherOfferImageLocator56)
import Types.OurPrice6 (OurPrice6)
import Types.PurchasableOffer6 (PurchasableOffer6)
import Types.Schedule6 (Schedule6)

data Offer6 = Offer6
  { conditionType :: Maybe Text
  , fulfillmentAvailability :: FulfillmentAvailability6
  , importDesignation :: Text
  , mainOfferImageLocator :: MainOfferImageLocator6
  , otherOfferImageLocator1 :: OtherOfferImageLocator16
  , otherOfferImageLocator2 :: OtherOfferImageLocator26
  , otherOfferImageLocator3 :: OtherOfferImageLocator36
  , otherOfferImageLocator4 :: OtherOfferImageLocator46
  , otherOfferImageLocator5 :: OtherOfferImageLocator56
  , purchasableOffer :: PurchasableOffer6
  }
  deriving (Show, Eq)

instance FromJSON Offer6 where
  parseJSON = withObject "Offer6" $ \obj -> do
    conditionType <- obj .: "condition_type"
    fulfillmentAvailability <- obj .: "fulfillment_availability"
    importDesignation <- obj .: "import_designation"
    mainOfferImageLocator <- obj .: "main_offer_image_locator"
    otherOfferImageLocator1 <- obj .: "other_offer_image_locator_1"
    otherOfferImageLocator2 <- obj .: "other_offer_image_locator_2"
    otherOfferImageLocator3 <- obj .: "other_offer_image_locator_3"
    otherOfferImageLocator4 <- obj .: "other_offer_image_locator_4"
    otherOfferImageLocator5 <- obj .: "other_offer_image_locator_5"
    purchasableOffer <- obj .: "purchasable_offer"
    pure $ Offer6{..}

instance ToJSON Offer6 where
  toJSON Offer6{..} =
    object [
      "condition_type" .= conditionType,
      "fulfillment_availability" .= fulfillmentAvailability,
      "import_designation" .= importDesignation,
      "main_offer_image_locator" .= mainOfferImageLocator,
      "other_offer_image_locator_1" .= otherOfferImageLocator1,
      "other_offer_image_locator_2" .= otherOfferImageLocator2,
      "other_offer_image_locator_3" .= otherOfferImageLocator3,
      "other_offer_image_locator_4" .= otherOfferImageLocator4,
      "other_offer_image_locator_5" .= otherOfferImageLocator5,
      "purchasable_offer" .= purchasableOffer
    ]
