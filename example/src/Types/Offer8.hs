{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Offer8 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.FulfillmentAvailability8 (FulfillmentAvailability8)
import Types.MainOfferImageLocator8 (MainOfferImageLocator8)
import Types.OtherOfferImageLocator18 (OtherOfferImageLocator18)
import Types.OtherOfferImageLocator28 (OtherOfferImageLocator28)
import Types.OtherOfferImageLocator38 (OtherOfferImageLocator38)
import Types.OtherOfferImageLocator48 (OtherOfferImageLocator48)
import Types.OtherOfferImageLocator58 (OtherOfferImageLocator58)
import Types.OurPrice8 (OurPrice8)
import Types.PurchasableOffer8 (PurchasableOffer8)
import Types.Schedule8 (Schedule8)

data Offer8 = Offer8
  { conditionType :: Maybe Text
  , fulfillmentAvailability :: FulfillmentAvailability8
  , mainOfferImageLocator :: MainOfferImageLocator8
  , otherOfferImageLocator1 :: OtherOfferImageLocator18
  , otherOfferImageLocator2 :: OtherOfferImageLocator28
  , otherOfferImageLocator3 :: OtherOfferImageLocator38
  , otherOfferImageLocator4 :: OtherOfferImageLocator48
  , otherOfferImageLocator5 :: OtherOfferImageLocator58
  , purchasableOffer :: PurchasableOffer8
  }
  deriving (Show, Eq)

instance FromJSON Offer8 where
  parseJSON = withObject "Offer8" $ \obj -> do
    conditionType <- obj .: "condition_type"
    fulfillmentAvailability <- obj .: "fulfillment_availability"
    mainOfferImageLocator <- obj .: "main_offer_image_locator"
    otherOfferImageLocator1 <- obj .: "other_offer_image_locator_1"
    otherOfferImageLocator2 <- obj .: "other_offer_image_locator_2"
    otherOfferImageLocator3 <- obj .: "other_offer_image_locator_3"
    otherOfferImageLocator4 <- obj .: "other_offer_image_locator_4"
    otherOfferImageLocator5 <- obj .: "other_offer_image_locator_5"
    purchasableOffer <- obj .: "purchasable_offer"
    pure $ Offer8{..}

instance ToJSON Offer8 where
  toJSON Offer8{..} =
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
