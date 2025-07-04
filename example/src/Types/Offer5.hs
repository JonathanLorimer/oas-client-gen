{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Offer5 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.FulfillmentAvailability5 (FulfillmentAvailability5)
import Types.MainOfferImageLocator5 (MainOfferImageLocator5)
import Types.OtherOfferImageLocator15 (OtherOfferImageLocator15)
import Types.OtherOfferImageLocator25 (OtherOfferImageLocator25)
import Types.OtherOfferImageLocator35 (OtherOfferImageLocator35)
import Types.OtherOfferImageLocator45 (OtherOfferImageLocator45)
import Types.OtherOfferImageLocator55 (OtherOfferImageLocator55)
import Types.OurPrice5 (OurPrice5)
import Types.PurchasableOffer5 (PurchasableOffer5)
import Types.Schedule5 (Schedule5)

data Offer5 = Offer5
  { conditionType :: Maybe Text
  , fulfillmentAvailability :: FulfillmentAvailability5
  , importDesignation :: Text
  , mainOfferImageLocator :: MainOfferImageLocator5
  , otherOfferImageLocator1 :: OtherOfferImageLocator15
  , otherOfferImageLocator2 :: OtherOfferImageLocator25
  , otherOfferImageLocator3 :: OtherOfferImageLocator35
  , otherOfferImageLocator4 :: OtherOfferImageLocator45
  , otherOfferImageLocator5 :: OtherOfferImageLocator55
  , purchasableOffer :: PurchasableOffer5
  }
  deriving (Show, Eq)

instance FromJSON Offer5 where
  parseJSON = withObject "Offer5" $ \obj -> do
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
    pure $ Offer5{..}

instance ToJSON Offer5 where
  toJSON Offer5{..} =
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
