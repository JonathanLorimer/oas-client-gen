{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AdditionalFields39 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data AdditionalFields39 = AdditionalFields39
  { taxAgencyId :: Text
  , taxAuthorityName :: Text
  }
  deriving (Show, Eq)

instance FromJSON AdditionalFields39 where
  parseJSON = withObject "AdditionalFields39" $ \obj -> do
    taxAgencyId <- obj .: "tax_agency_id"
    taxAuthorityName <- obj .: "tax_authority_name"
    pure $ AdditionalFields39{..}

instance ToJSON AdditionalFields39 where
  toJSON AdditionalFields39{..} =
    object [
      "tax_agency_id" .= taxAgencyId,
      "tax_authority_name" .= taxAuthorityName
    ]
