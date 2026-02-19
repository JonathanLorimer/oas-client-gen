{-# LANGUAGE StrictData #-}

module OAS.Schema.Tag where

import Data.Aeson
import Data.Maybe (catMaybes)
import Data.Text (Text)
import OAS.Schema.ExternalDocs (ExternalDocs)

data Tag = Tag
  { name :: Text
  , description :: Maybe Text
  , externalDocs :: ExternalDocs
  }
  deriving (Show, Eq)

instance FromJSON Tag where
  parseJSON = withObject "Tag" \o ->
    Tag
      <$> o .: "name"
      <*> o .:? "description"
      <*> o .: "externalDocs"

instance ToJSON Tag where
  toJSON Tag{..} = object $ catMaybes
    [ Just $ "name" .= name
    , ("description" .=) <$> description
    , Just $ "externalDocs" .= externalDocs
    ]
