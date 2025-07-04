{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.PurchasableOffer2 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.OurPrice2 (OurPrice2)
import Types.Schedule2 (Schedule2)

data PurchasableOffer2 = PurchasableOffer2
  { currency :: Text
  , ourPrice :: [OurPrice2]
  }
  deriving (Show, Eq)

instance FromJSON PurchasableOffer2 where
  parseJSON = withObject "PurchasableOffer2" $ \obj -> do
    currency <- obj .: "currency"
    ourPrice <- obj .: "our_price"
    pure $ PurchasableOffer2{..}

instance ToJSON PurchasableOffer2 where
  toJSON PurchasableOffer2{..} =
    object [
      "currency" .= currency,
      "our_price" .= ourPrice
    ]
