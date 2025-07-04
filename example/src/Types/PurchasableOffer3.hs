{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.PurchasableOffer3 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.OurPrice3 (OurPrice3)
import Types.Schedule3 (Schedule3)

data PurchasableOffer3 = PurchasableOffer3
  { currency :: Text
  , ourPrice :: [OurPrice3]
  }
  deriving (Show, Eq)

instance FromJSON PurchasableOffer3 where
  parseJSON = withObject "PurchasableOffer3" $ \obj -> do
    currency <- obj .: "currency"
    ourPrice <- obj .: "our_price"
    pure $ PurchasableOffer3{..}

instance ToJSON PurchasableOffer3 where
  toJSON PurchasableOffer3{..} =
    object [
      "currency" .= currency,
      "our_price" .= ourPrice
    ]
