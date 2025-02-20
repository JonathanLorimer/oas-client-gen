{-# LANGUAGE StrictData #-}

module OAS.Schema.Tag where

import Data.Text (Text)
import OAS.Schema.ExternalDocs (ExternalDocs)

data Tag = Tag
  { name :: Text
  , description :: Maybe Text
  , externalDocs :: ExternalDocs
  }
