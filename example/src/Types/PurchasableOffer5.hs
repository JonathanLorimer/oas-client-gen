{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.PurchasableOffer5 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.OurPrice5 (OurPrice5)
import Types.Schedule5 (Schedule5)

data PurchasableOffer5 = PurchasableOffer5
  { currency :: Text
  , ourPrice :: [OurPrice5]
  }
  deriving (Show, Eq)

instance FromJSON PurchasableOffer5 where
  parseJSON = withObject "PurchasableOffer5" $ \obj -> do
    currency <- obj .: "currency"
    ourPrice <- obj .: "our_price"
    pure $ PurchasableOffer5{..}

instance ToJSON PurchasableOffer5 where
  toJSON PurchasableOffer5{..} =
    object [
      "currency" .= currency,
      "our_price" .= ourPrice
    ]
