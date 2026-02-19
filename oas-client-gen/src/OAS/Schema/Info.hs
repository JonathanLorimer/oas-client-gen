{-# LANGUAGE StrictData #-}

module OAS.Schema.Info where

import Data.Aeson
import Data.Maybe (catMaybes)
import Data.Text (Text)
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
  deriving (Show, Eq)

instance FromJSON Info where
  parseJSON = withObject "Info" \o ->
    Info
      <$> o .: "title"
      <*> o .:? "summary"
      <*> o .:? "description"
      <*> o .:? "termsOfService"
      <*> o .:? "contact"
      <*> o .:? "license"
      <*> o .: "version"
      <*> o .:? "paths"

instance ToJSON Info where
  toJSON Info{..} = object $ catMaybes
    [ Just $ "title" .= title
    , ("summary" .=) <$> summary
    , ("description" .=) <$> description
    , ("termsOfService" .=) <$> termsOfService
    , ("contact" .=) <$> contact
    , ("license" .=) <$> license
    , Just $ "version" .= version
    , ("paths" .=) <$> paths
    ]

-- | <https://swagger.io/specification/#contact-object>
data Contact = Contact
  { name :: Maybe Text
  , url :: Maybe Text
  , email :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON Contact where
  parseJSON = withObject "Contact" \o ->
    Contact
      <$> o .:? "name"
      <*> o .:? "url"
      <*> o .:? "email"

instance ToJSON Contact where
  toJSON Contact{..} = object $ catMaybes
    [ ("name" .=) <$> name
    , ("url" .=) <$> url
    , ("email" .=) <$> email
    ]

-- | <https://swagger.io/specification/#license-object>
data License = License
  { name :: Maybe Text
  , identifier :: Maybe Text
  , email :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON License where
  parseJSON = withObject "License" \o ->
    License
      <$> o .:? "name"
      <*> o .:? "identifier"
      <*> o .:? "email"

instance ToJSON License where
  toJSON License{..} = object $ catMaybes
    [ ("name" .=) <$> name
    , ("identifier" .=) <$> identifier
    , ("email" .=) <$> email
    ]
