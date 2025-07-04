{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.PurchasableOffer6 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.OurPrice6 (OurPrice6)
import Types.Schedule6 (Schedule6)

data PurchasableOffer6 = PurchasableOffer6
  { currency :: Text
  , ourPrice :: [OurPrice6]
  }
  deriving (Show, Eq)

instance FromJSON PurchasableOffer6 where
  parseJSON = withObject "PurchasableOffer6" $ \obj -> do
    currency <- obj .: "currency"
    ourPrice <- obj .: "our_price"
    pure $ PurchasableOffer6{..}

instance ToJSON PurchasableOffer6 where
  toJSON PurchasableOffer6{..} =
    object [
      "currency" .= currency,
      "our_price" .= ourPrice
    ]
