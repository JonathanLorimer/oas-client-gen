{-# LANGUAGE StrictData #-}

module OAS.Schema.Info where

import Data.Map.Strict (Map)
import Data.Text (Text)
import Deriving.Aeson
import OAS.Schema.Path (Paths)

-- | <https://swagger.io/specification/#info-object>
data Info = Info
  { title :: Text
  , summary :: Maybe Text
  , description :: Maybe Text
  , termsOfService :: Maybe Text
  , contact :: Maybe Contact
  , license :: Maybe License
  , version :: Text
  , paths :: Maybe Paths
  }
  deriving (Show, Eq, Generic)
  deriving
    (FromJSON, ToJSON)
    via CustomJSON '[OmitNothingFields] Info

-- | <https://swagger.io/specification/#contact-object>
data Contact = Contact
  { name :: Maybe Text
  , url :: Maybe Text
  , email :: Maybe Text
  }
  deriving (Show, Eq, Generic)
  deriving
    (FromJSON, ToJSON)
    via CustomJSON '[OmitNothingFields] Contact

-- | <https://swagger.io/specification/#license-object>
data License = License
  { name :: Maybe Text
  , identifier :: Maybe Text
  , email :: Maybe Text
  }
  deriving (Show, Eq, Generic)
  deriving
    (FromJSON, ToJSON)
    via CustomJSON '[OmitNothingFields] License
