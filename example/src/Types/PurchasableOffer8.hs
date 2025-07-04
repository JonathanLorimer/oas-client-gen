{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.PurchasableOffer8 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.OurPrice8 (OurPrice8)
import Types.Schedule8 (Schedule8)

data PurchasableOffer8 = PurchasableOffer8
  { currency :: Text
  , ourPrice :: [OurPrice8]
  }
  deriving (Show, Eq)

instance FromJSON PurchasableOffer8 where
  parseJSON = withObject "PurchasableOffer8" $ \obj -> do
    currency <- obj .: "currency"
    ourPrice <- obj .: "our_price"
    pure $ PurchasableOffer8{..}

instance ToJSON PurchasableOffer8 where
  toJSON PurchasableOffer8{..} =
    object [
      "currency" .= currency,
      "our_price" .= ourPrice
    ]
