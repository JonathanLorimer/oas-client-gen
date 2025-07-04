{-# LANGUAGE StrictData #-}

module OAS.Schema.ExternalDocs where

import Data.Text (Text)
import Deriving.Aeson

data ExternalDocs = ExternalDocs
  { description :: Maybe Text
  , url :: Text
  }
  deriving (Show, Eq, Generic)
  deriving
    (FromJSON, ToJSON)
    via CustomJSON '[OmitNothingFields] ExternalDocs
