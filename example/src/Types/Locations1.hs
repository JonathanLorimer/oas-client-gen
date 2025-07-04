{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Locations1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Locations1 = Locations1
  { address1 :: Text
  , address2 :: Text
  , city :: Text
  , country :: Text
  , id :: Text
  , name :: Text
  , postalCode :: Text
  , quantity :: Double
  , region :: Text
  , updatedAt :: Text
  }
  deriving (Show, Eq)

instance FromJSON Locations1 where
  parseJSON = withObject "Locations1" $ \obj -> do
    address1 <- obj .: "address1"
    address2 <- obj .: "address2"
    city <- obj .: "city"
    country <- obj .: "country"
    id <- obj .: "id"
    name <- obj .: "name"
    postalCode <- obj .: "postal_code"
    quantity <- obj .: "quantity"
    region <- obj .: "region"
    updatedAt <- obj .: "updated_at"
    pure $ Locations1{..}

instance ToJSON Locations1 where
  toJSON Locations1{..} =
    object [
      "address1" .= address1,
      "address2" .= address2,
      "city" .= city,
      "country" .= country,
      "id" .= id,
      "name" .= name,
      "postal_code" .= postalCode,
      "quantity" .= quantity,
      "region" .= region,
      "updated_at" .= updatedAt
    ]
