{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.BankFeedOtp where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data BankFeedOtp = BankFeedOtp
  { expiresAt :: Text
  , otp :: Text
  , redirectUri :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON BankFeedOtp where
  parseJSON = withObject "BankFeedOtp" $ \obj -> do
    expiresAt <- obj .: "expires_at"
    otp <- obj .: "otp"
    redirectUri <- obj .: "redirect_uri"
    pure $ BankFeedOtp{..}

instance ToJSON BankFeedOtp where
  toJSON BankFeedOtp{..} =
    object [
      "expires_at" .= expiresAt,
      "otp" .= otp,
      "redirect_uri" .= redirectUri
    ]
