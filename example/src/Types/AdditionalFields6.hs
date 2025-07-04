{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AdditionalFields6 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data AdditionalFields6 = AdditionalFields6
  { classId :: Text
  , reference :: Text
  , taxInclusive :: Bool
  }
  deriving (Show, Eq)

instance FromJSON AdditionalFields6 where
  parseJSON = withObject "AdditionalFields6" $ \obj -> do
    classId <- obj .: "class_id"
    reference <- obj .: "reference"
    taxInclusive <- obj .: "tax_inclusive"
    pure $ AdditionalFields6{..}

instance ToJSON AdditionalFields6 where
  toJSON AdditionalFields6{..} =
    object [
      "class_id" .= classId,
      "reference" .= reference,
      "tax_inclusive" .= taxInclusive
    ]
