{-# LANGUAGE StrictData #-}

module OAS.Schema.ExternalDocs where

import Data.Aeson
import Data.Maybe (catMaybes)
import Data.Text (Text)

data ExternalDocs = ExternalDocs
  { description :: Maybe Text
  , url :: Text
  }
  deriving (Show, Eq)

instance FromJSON ExternalDocs where
  parseJSON = withObject "ExternalDocs" \o ->
    ExternalDocs
      <$> o .:? "description"
      <*> o .: "url"

instance ToJSON ExternalDocs where
  toJSON ExternalDocs{..} = object $ catMaybes
    [ ("description" .=) <$> description
    , Just $ "url" .= url
    ]
