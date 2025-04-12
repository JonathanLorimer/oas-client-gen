{-# LANGUAGE StrictData #-}

module OAS.Schema.Tag where

import Data.Text (Text)
import Deriving.Aeson
import OAS.Schema.ExternalDocs (ExternalDocs)

data Tag = Tag
  { name :: Text
  , description :: Maybe Text
  , externalDocs :: ExternalDocs
  }
  deriving (Show, Eq, Generic)
  deriving
    (FromJSON, ToJSON)
    via CustomJSON '[OmitNothingFields] Tag
