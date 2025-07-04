{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.LineItems20 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AdditionalFields37 (AdditionalFields37)
import Types.Item12 (Item12)

data LineItems20 = LineItems20
  { additionalFields :: AdditionalFields37
  , description :: Text
  , item :: Item12
  , taxRateId :: Text
  }
  deriving (Show, Eq)

instance FromJSON LineItems20 where
  parseJSON = withObject "LineItems20" $ \obj -> do
    additionalFields <- obj .: "additional_fields"
    description <- obj .: "description"
    item <- obj .: "item"
    taxRateId <- obj .: "tax_rate_id"
    pure $ LineItems20{..}

instance ToJSON LineItems20 where
  toJSON LineItems20{..} =
    object [
      "additional_fields" .= additionalFields,
      "description" .= description,
      "item" .= item,
      "tax_rate_id" .= taxRateId
    ]
