{-# LANGUAGE StrictData #-}

module OAS.Schema.ExternalDocs where

import Data.Text (Text)

data ExternalDocs = ExternalDocs
  { description :: Maybe Text
  , url :: Text
  }
