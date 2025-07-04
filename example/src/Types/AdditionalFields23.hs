{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AdditionalFields23 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data AdditionalFields23 = AdditionalFields23
  { taxRateId :: Text
  }
  deriving (Show, Eq)

instance FromJSON AdditionalFields23 where
  parseJSON = withObject "AdditionalFields23" $ \obj -> do
    taxRateId <- obj .: "tax_rate_id"
    pure $ AdditionalFields23{..}

instance ToJSON AdditionalFields23 where
  toJSON AdditionalFields23{..} =
    object [
      "tax_rate_id" .= taxRateId
    ]
