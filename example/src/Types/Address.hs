{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Address where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Address = Address
  { city :: Text
  , country :: Text
  , postalCode :: Maybe Text
  , state :: Maybe Text
  , street :: Text
  }
  deriving (Show, Eq)

instance FromJSON Address where
  parseJSON = withObject "Address" $ \obj -> do
    city <- obj .: "city"
    country <- obj .: "country"
    postalCode <- obj .: "postal_code"
    state <- obj .: "state"
    street <- obj .: "street"
    pure $ Address{..}

instance ToJSON Address where
  toJSON Address{..} =
    object [
      "city" .= city,
      "country" .= country,
      "postal_code" .= postalCode,
      "state" .= state,
      "street" .= street
    ]
