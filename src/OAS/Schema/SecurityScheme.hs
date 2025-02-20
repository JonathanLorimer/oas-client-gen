{-# LANGUAGE StrictData #-}

module OAS.Schema.SecurityScheme where

import Data.Aeson (FromJSON, ToJSON)
import Data.Map.Strict (Map)
import Data.Maybe (Maybe)
import Data.Text (Text)
import GHC.Generics (Generic)

-- | The type of security scheme
data SecuritySchemeType
  = ApiKey
  | Http
  | MutualTLS
  | OAuth2
  | OpenIdConnect
  deriving (Show, Eq, Generic)

-- | The location of the API key
data ApiKeyLocation
  = InQuery
  | InHeader
  | InCookie
  deriving (Show, Eq, Generic)

-- | OAuth Flow Object
data OAuthFlow = OAuthFlow
  { -- The authorization URL to be used for this flow. Required for implicit and authorizationCode flows.
    authorizationUrl :: Maybe Text
  , -- The token URL to be used for this flow. Required for password, clientCredentials, and authorizationCode flows.
    tokenUrl :: Maybe Text
  , -- The URL to be used for obtaining refresh tokens. This is optional.
    refreshUrl :: Maybe Text
  , -- The available scopes for the OAuth2 security scheme. A map between the scope name and a description.
    scopes :: Map Text Text
  }
  deriving (Show, Eq, Generic)

-- | OAuth Flows Object
data OAuthFlows = OAuthFlows
  { -- Configuration for the OAuth Implicit flow
    implicitFlow :: Maybe OAuthFlow
  , -- Configuration for the OAuth Resource Owner Password flow
    passwordFlow :: Maybe OAuthFlow
  , -- Configuration for the OAuth Client Credentials flow
    clientCredentialsFlow :: Maybe OAuthFlow
  , -- Configuration for the OAuth Authorization Code flow
    authorizationCodeFlow :: Maybe OAuthFlow
  }
  deriving (Show, Eq, Generic)

-- | The main SecurityScheme type
data SecurityScheme = SecurityScheme
  { -- Common fields
    schemeType :: SecuritySchemeType
  , schemeDescription :: Maybe Text
  , -- Fields specific to ApiKey
    schemeName :: Maybe Text -- REQUIRED for ApiKey
  , schemeIn :: Maybe ApiKeyLocation -- REQUIRED for ApiKey
  , -- Fields specific to Http
    schemeScheme :: Maybe Text -- REQUIRED for Http
  , schemeBearerFormat :: Maybe Text -- For Http ("bearer")
  , -- Fields specific to OAuth2
    schemeFlows :: Maybe OAuthFlows -- REQUIRED for OAuth2
  , -- Fields specific to OpenIdConnect
    schemeOpenIdConnectUrl :: Maybe Text -- REQUIRED for OpenIdConnect
  }
  deriving (Show, Eq, Generic)
