{-# LANGUAGE StrictData #-}

module OAS.Schema.SecurityScheme where

import Data.Aeson
import Data.Map.Strict (Map)
import Data.Maybe (catMaybes)
import Data.Text (Text)

-- | The type of security scheme
data SecuritySchemeType
  = ApiKey
  | Http
  | MutualTLS
  | OAuth2
  | OpenIdConnect
  deriving (Show, Eq)

instance FromJSON SecuritySchemeType where
  parseJSON = withText "SecuritySchemeType" \case
    "apikey" -> pure ApiKey
    "http" -> pure Http
    "mutualtls" -> pure MutualTLS
    "oauth2" -> pure OAuth2
    "openidconnect" -> pure OpenIdConnect
    t -> fail $ "Unknown SecuritySchemeType: " <> show t

instance ToJSON SecuritySchemeType where
  toJSON = \case
    ApiKey -> "apikey"
    Http -> "http"
    MutualTLS -> "mutualtls"
    OAuth2 -> "oauth2"
    OpenIdConnect -> "openidconnect"

-- | The location of the API key
data ApiKeyLocation
  = InQuery
  | InHeader
  | InCookie
  deriving (Show, Eq)

instance FromJSON ApiKeyLocation where
  parseJSON = withText "ApiKeyLocation" \case
    "query" -> pure InQuery
    "header" -> pure InHeader
    "cookie" -> pure InCookie
    t -> fail $ "Unknown ApiKeyLocation: " <> show t

instance ToJSON ApiKeyLocation where
  toJSON = \case
    InQuery -> "query"
    InHeader -> "header"
    InCookie -> "cookie"

-- | OAuth Flow Object
data OAuthFlow = OAuthFlow
  { authorizationUrl :: Maybe Text
  , tokenUrl :: Maybe Text
  , refreshUrl :: Maybe Text
  , scopes :: Map Text Text
  }
  deriving (Show, Eq)

instance FromJSON OAuthFlow where
  parseJSON = withObject "OAuthFlow" \o ->
    OAuthFlow
      <$> o .:? "authorizationUrl"
      <*> o .:? "tokenUrl"
      <*> o .:? "refreshUrl"
      <*> o .: "scopes"

instance ToJSON OAuthFlow where
  toJSON OAuthFlow{..} = object $ catMaybes
    [ ("authorizationUrl" .=) <$> authorizationUrl
    , ("tokenUrl" .=) <$> tokenUrl
    , ("refreshUrl" .=) <$> refreshUrl
    , Just $ "scopes" .= scopes
    ]

-- | OAuth Flows Object
data OAuthFlows = OAuthFlows
  { implicitFlow :: Maybe OAuthFlow
  , passwordFlow :: Maybe OAuthFlow
  , clientCredentialsFlow :: Maybe OAuthFlow
  , authorizationCodeFlow :: Maybe OAuthFlow
  }
  deriving (Show, Eq)

instance FromJSON OAuthFlows where
  parseJSON = withObject "OAuthFlows" \o ->
    OAuthFlows
      <$> o .:? "implicit"
      <*> o .:? "password"
      <*> o .:? "clientCredentials"
      <*> o .:? "authorizationCode"

instance ToJSON OAuthFlows where
  toJSON OAuthFlows{..} = object $ catMaybes
    [ ("implicit" .=) <$> implicitFlow
    , ("password" .=) <$> passwordFlow
    , ("clientCredentials" .=) <$> clientCredentialsFlow
    , ("authorizationCode" .=) <$> authorizationCodeFlow
    ]

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
  deriving (Show, Eq)

instance FromJSON SecurityScheme where
  parseJSON = withObject "SecurityScheme" \o ->
    SecurityScheme
      <$> o .: "type"
      <*> o .:? "description"
      <*> o .:? "name"
      <*> o .:? "in"
      <*> o .:? "scheme"
      <*> o .:? "bearerFormat"
      <*> o .:? "flows"
      <*> o .:? "openIdConnectUrl"

instance ToJSON SecurityScheme where
  toJSON SecurityScheme{..} = object $ catMaybes
    [ Just $ "type" .= schemeType
    , ("description" .=) <$> schemeDescription
    , ("name" .=) <$> schemeName
    , ("in" .=) <$> schemeIn
    , ("scheme" .=) <$> schemeScheme
    , ("bearerFormat" .=) <$> schemeBearerFormat
    , ("flows" .=) <$> schemeFlows
    , ("openIdConnectUrl" .=) <$> schemeOpenIdConnectUrl
    ]
