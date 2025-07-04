{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AdditionalFields36 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data AdditionalFields36 = AdditionalFields36
  { closingDate :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON AdditionalFields36 where
  parseJSON = withObject "AdditionalFields36" $ \obj -> do
    closingDate <- obj .: "closing_date"
    pure $ AdditionalFields36{..}

instance ToJSON AdditionalFields36 where
  toJSON AdditionalFields36{..} =
    object [
      "closing_date" .= closingDate
    ]
