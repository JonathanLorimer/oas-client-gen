{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.PurchasableOffer7 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.OurPrice7 (OurPrice7)
import Types.Schedule7 (Schedule7)

data PurchasableOffer7 = PurchasableOffer7
  { currency :: Text
  , ourPrice :: [OurPrice7]
  }
  deriving (Show, Eq)

instance FromJSON PurchasableOffer7 where
  parseJSON = withObject "PurchasableOffer7" $ \obj -> do
    currency <- obj .: "currency"
    ourPrice <- obj .: "our_price"
    pure $ PurchasableOffer7{..}

instance ToJSON PurchasableOffer7 where
  toJSON PurchasableOffer7{..} =
    object [
      "currency" .= currency,
      "our_price" .= ourPrice
    ]
