{-# LANGUAGE StrictData #-}

module OAS.Schema.Info where

import Data.Map.Strict (Map)
import Data.Text (Text)
import OAS.Schema.Path (Path)

-- | <https://swagger.io/specification/#info-object>
data Info = Info
  { title :: Text
  , summary :: Maybe Text
  , description :: Maybe Text
  -- ^ A description of the API. [CommonMark](https://spec.commonmark.org/) syntax MAY be used for rich text representation.
  , termsOfService :: Maybe Text
  -- ^ A URI for the Terms of Service for the API. This MUST be in the form of a URI.
  , contact :: Maybe Contact
  , license :: Maybe License
  , version :: Text
  -- ^ The version of the OpenAPI Document (which is distinct from the OpenAPI
  -- Specification version or the version of the API being described or the version
  -- of the OpenAPI Description).
  , paths :: Map Text Path
  }

-- | <https://swagger.io/specification/#contact-object>
data Contact = Contact
  { name :: Maybe Text
  , url :: Maybe Text
  -- ^ The URI for the contact information. This MUST be in the form of a URI.
  , email :: Maybe Text
  -- ^ The email address of the contact person/organization. This MUST be in the form of an email address.
  }

-- | <https://swagger.io/specification/#license-object>
data License = License
  { name :: Maybe Text
  , idetnifier :: Maybe Text
  -- ^ The URI for the contact information. This MUST be in the form of a URI.
  , email :: Maybe Text
  -- ^ The email address of the contact person/organization. This MUST be in the form of an email address.
  }
