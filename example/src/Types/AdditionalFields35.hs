{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AdditionalFields35 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data AdditionalFields35 = AdditionalFields35
  { accountId :: Text
  , classId :: Text
  , departmentId :: Text
  , locationId :: Text
  }
  deriving (Show, Eq)

instance FromJSON AdditionalFields35 where
  parseJSON = withObject "AdditionalFields35" $ \obj -> do
    accountId <- obj .: "account_id"
    classId <- obj .: "class_id"
    departmentId <- obj .: "department_id"
    locationId <- obj .: "location_id"
    pure $ AdditionalFields35{..}

instance ToJSON AdditionalFields35 where
  toJSON AdditionalFields35{..} =
    object [
      "account_id" .= accountId,
      "class_id" .= classId,
      "department_id" .= departmentId,
      "location_id" .= locationId
    ]
