{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.PurchasableOffer4 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.OurPrice4 (OurPrice4)
import Types.Schedule4 (Schedule4)

data PurchasableOffer4 = PurchasableOffer4
  { currency :: Text
  , ourPrice :: [OurPrice4]
  }
  deriving (Show, Eq)

instance FromJSON PurchasableOffer4 where
  parseJSON = withObject "PurchasableOffer4" $ \obj -> do
    currency <- obj .: "currency"
    ourPrice <- obj .: "our_price"
    pure $ PurchasableOffer4{..}

instance ToJSON PurchasableOffer4 where
  toJSON PurchasableOffer4{..} =
    object [
      "currency" .= currency,
      "our_price" .= ourPrice
    ]
