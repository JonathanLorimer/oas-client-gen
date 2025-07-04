{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Offer7 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.FulfillmentAvailability7 (FulfillmentAvailability7)
import Types.MainOfferImageLocator7 (MainOfferImageLocator7)
import Types.OtherOfferImageLocator17 (OtherOfferImageLocator17)
import Types.OtherOfferImageLocator27 (OtherOfferImageLocator27)
import Types.OtherOfferImageLocator37 (OtherOfferImageLocator37)
import Types.OtherOfferImageLocator47 (OtherOfferImageLocator47)
import Types.OtherOfferImageLocator57 (OtherOfferImageLocator57)
import Types.OurPrice7 (OurPrice7)
import Types.PurchasableOffer7 (PurchasableOffer7)
import Types.Schedule7 (Schedule7)

data Offer7 = Offer7
  { conditionType :: Maybe Text
  , fulfillmentAvailability :: FulfillmentAvailability7
  , importDesignation :: Text
  , mainOfferImageLocator :: MainOfferImageLocator7
  , otherOfferImageLocator1 :: OtherOfferImageLocator17
  , otherOfferImageLocator2 :: OtherOfferImageLocator27
  , otherOfferImageLocator3 :: OtherOfferImageLocator37
  , otherOfferImageLocator4 :: OtherOfferImageLocator47
  , otherOfferImageLocator5 :: OtherOfferImageLocator57
  , purchasableOffer :: PurchasableOffer7
  }
  deriving (Show, Eq)

instance FromJSON Offer7 where
  parseJSON = withObject "Offer7" $ \obj -> do
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
    pure $ Offer7{..}

instance ToJSON Offer7 where
  toJSON Offer7{..} =
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
