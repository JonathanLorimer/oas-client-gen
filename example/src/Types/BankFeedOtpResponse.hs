{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.BankFeedOtpResponse where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.BankFeedOtp (BankFeedOtp)

data BankFeedOtpResponse = BankFeedOtpResponse
  { bankFeedOtp :: BankFeedOtp
  }
  deriving (Show, Eq)

instance FromJSON BankFeedOtpResponse where
  parseJSON = withObject "BankFeedOtpResponse" $ \obj -> do
    bankFeedOtp <- obj .: "bank_feed_otp"
    pure $ BankFeedOtpResponse{..}

instance ToJSON BankFeedOtpResponse where
  toJSON BankFeedOtpResponse{..} =
    object [
      "bank_feed_otp" .= bankFeedOtp
    ]
