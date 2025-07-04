{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AdditionalFields13 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data AdditionalFields13 = AdditionalFields13
  { closingDate :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON AdditionalFields13 where
  parseJSON = withObject "AdditionalFields13" $ \obj -> do
    closingDate <- obj .: "closing_date"
    pure $ AdditionalFields13{..}

instance ToJSON AdditionalFields13 where
  toJSON AdditionalFields13{..} =
    object [
      "closing_date" .= closingDate
    ]
