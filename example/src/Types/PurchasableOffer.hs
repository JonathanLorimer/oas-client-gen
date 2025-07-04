{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.PurchasableOffer where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.OurPrice (OurPrice)
import Types.Schedule (Schedule)

data PurchasableOffer = PurchasableOffer
  { currency :: Text
  , ourPrice :: [OurPrice]
  }
  deriving (Show, Eq)

instance FromJSON PurchasableOffer where
  parseJSON = withObject "PurchasableOffer" $ \obj -> do
    currency <- obj .: "currency"
    ourPrice <- obj .: "our_price"
    pure $ PurchasableOffer{..}

instance ToJSON PurchasableOffer where
  toJSON PurchasableOffer{..} =
    object [
      "currency" .= currency,
      "our_price" .= ourPrice
    ]
