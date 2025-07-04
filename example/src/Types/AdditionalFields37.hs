{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AdditionalFields37 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data AdditionalFields37 = AdditionalFields37
  { classId :: Text
  , taxInclusive :: Bool
  }
  deriving (Show, Eq)

instance FromJSON AdditionalFields37 where
  parseJSON = withObject "AdditionalFields37" $ \obj -> do
    classId <- obj .: "class_id"
    taxInclusive <- obj .: "tax_inclusive"
    pure $ AdditionalFields37{..}

instance ToJSON AdditionalFields37 where
  toJSON AdditionalFields37{..} =
    object [
      "class_id" .= classId,
      "tax_inclusive" .= taxInclusive
    ]
