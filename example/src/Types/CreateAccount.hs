{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateAccount where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AdditionalFields (AdditionalFields)

data CreateAccount = CreateAccount
  { accountType :: Text
  , additionalFields :: AdditionalFields
  , currencyCode :: Text
  , name :: Text
  , nominalCode :: Text
  , parentId :: Maybe Text
  , subsidiaryId :: Text
  }
  deriving (Show, Eq)

instance FromJSON CreateAccount where
  parseJSON = withObject "CreateAccount" $ \obj -> do
    accountType <- obj .: "account_type"
    additionalFields <- obj .: "additional_fields"
    currencyCode <- obj .: "currency_code"
    name <- obj .: "name"
    nominalCode <- obj .: "nominal_code"
    parentId <- obj .: "parent_id"
    subsidiaryId <- obj .: "subsidiary_id"
    pure $ CreateAccount{..}

instance ToJSON CreateAccount where
  toJSON CreateAccount{..} =
    object [
      "account_type" .= accountType,
      "additional_fields" .= additionalFields,
      "currency_code" .= currencyCode,
      "name" .= name,
      "nominal_code" .= nominalCode,
      "parent_id" .= parentId,
      "subsidiary_id" .= subsidiaryId
    ]
