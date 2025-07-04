{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.PurchasableOffer1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.OurPrice1 (OurPrice1)
import Types.Schedule1 (Schedule1)

data PurchasableOffer1 = PurchasableOffer1
  { currency :: Text
  , ourPrice :: [OurPrice1]
  }
  deriving (Show, Eq)

instance FromJSON PurchasableOffer1 where
  parseJSON = withObject "PurchasableOffer1" $ \obj -> do
    currency <- obj .: "currency"
    ourPrice <- obj .: "our_price"
    pure $ PurchasableOffer1{..}

instance ToJSON PurchasableOffer1 where
  toJSON PurchasableOffer1{..} =
    object [
      "currency" .= currency,
      "our_price" .= ourPrice
    ]
