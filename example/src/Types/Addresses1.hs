{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Addresses1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Addresses1 = Addresses1
  { address1 :: Maybe Text
  , address2 :: Maybe Text
  , address3 :: Maybe Text
  , city :: Maybe Text
  , country :: Maybe Text
  , postalCode :: Maybe Text
  , region :: Maybe Text
  , type_ :: Text
  }
  deriving (Show, Eq)

instance FromJSON Addresses1 where
  parseJSON = withObject "Addresses1" $ \obj -> do
    address1 <- obj .: "address1"
    address2 <- obj .: "address2"
    address3 <- obj .: "address3"
    city <- obj .: "city"
    country <- obj .: "country"
    postalCode <- obj .: "postal_code"
    region <- obj .: "region"
    type_ <- obj .: "type"
    pure $ Addresses1{..}

instance ToJSON Addresses1 where
  toJSON Addresses1{..} =
    object [
      "address1" .= address1,
      "address2" .= address2,
      "address3" .= address3,
      "city" .= city,
      "country" .= country,
      "postal_code" .= postalCode,
      "region" .= region,
      "type" .= type_
    ]
