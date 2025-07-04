{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.LineItems11 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AdditionalFields23 (AdditionalFields23)
import Types.Item7 (Item7)

data LineItems11 = LineItems11
  { accountId :: Text
  , additionalFields :: AdditionalFields23
  , classId :: Text
  , description :: Text
  , item :: Item7
  , totalAmount :: Text
  }
  deriving (Show, Eq)

instance FromJSON LineItems11 where
  parseJSON = withObject "LineItems11" $ \obj -> do
    accountId <- obj .: "account_id"
    additionalFields <- obj .: "additional_fields"
    classId <- obj .: "class_id"
    description <- obj .: "description"
    item <- obj .: "item"
    totalAmount <- obj .: "total_amount"
    pure $ LineItems11{..}

instance ToJSON LineItems11 where
  toJSON LineItems11{..} =
    object [
      "account_id" .= accountId,
      "additional_fields" .= additionalFields,
      "class_id" .= classId,
      "description" .= description,
      "item" .= item,
      "total_amount" .= totalAmount
    ]
