{-# LANGUAGE StrictData #-}

module OAS.Schema.SecurityScheme where

import Data.Aeson (FromJSON, ToJSON)
import Data.Map.Strict (Map)
import Data.Maybe (Maybe)
import Data.Text (Text)
import Deriving.Aeson
import GHC.Generics (Generic)
import OAS.Aeson.Modifiers

-- | The type of security scheme
data SecuritySchemeType
  = ApiKey
  | Http
  | MutualTLS
  | OAuth2
  | OpenIdConnect
  deriving (Show, Eq, Generic)
  deriving
    (FromJSON, ToJSON)
    via CustomJSON '[ConstructorTagModifier '[ToLower]] SecuritySchemeType

-- | The location of the API key
data ApiKeyLocation
  = InQuery
  | InHeader
  | InCookie
  deriving (Show, Eq, Generic)
  deriving
    (FromJSON, ToJSON)
    via CustomJSON '[ConstructorTagModifier '[StripPrefix "In", ToLower]] ApiKeyLocation

-- | OAuth Flow Object
data OAuthFlow = OAuthFlow
  { authorizationUrl :: Maybe Text
  , tokenUrl :: Maybe Text
  , refreshUrl :: Maybe Text
  , scopes :: Map Text Text
  }
  deriving (Show, Eq, Generic)
  deriving
    (FromJSON, ToJSON)
    via CustomJSON '[OmitNothingFields] OAuthFlow

-- | OAuth Flows Object
data OAuthFlows = OAuthFlows
  { implicitFlow :: Maybe OAuthFlow
  , passwordFlow :: Maybe OAuthFlow
  , clientCredentialsFlow :: Maybe OAuthFlow
  , authorizationCodeFlow :: Maybe OAuthFlow
  }
  deriving (Show, Eq, Generic)
  deriving
    (FromJSON, ToJSON)
    via CustomJSON
          '[ OmitNothingFields
           , FieldLabelModifier '[StripSuffix "Flow"]
           ]
          OAuthFlows

-- | The main SecurityScheme type
data SecurityScheme = SecurityScheme
  { schemeType :: SecuritySchemeType
  , schemeDescription :: Maybe Text
  , schemeName :: Maybe Text -- REQUIRED for ApiKey
  , schemeIn :: Maybe ApiKeyLocation -- REQUIRED for ApiKey
  , schemeScheme :: Maybe Text -- REQUIRED for Http
  , schemeBearerFormat :: Maybe Text -- For Http ("bearer")
  , schemeFlows :: Maybe OAuthFlows -- REQUIRED for OAuth2
  , schemeOpenIdConnectUrl :: Maybe Text -- REQUIRED for OpenIdConnect
  }
  deriving (Show, Eq, Generic)
  deriving
    (FromJSON, ToJSON)
    via CustomJSON
          '[ OmitNothingFields
           , FieldLabelModifier '[StripPrefix "scheme", LowerFirst]
           ]
          SecurityScheme
