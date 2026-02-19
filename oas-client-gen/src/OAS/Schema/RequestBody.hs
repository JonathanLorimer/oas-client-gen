{-# LANGUAGE StrictData #-}

module OAS.Schema.RequestBody where

import Data.Aeson
import Data.Map.Strict (Map)
import Data.Text (Text)
import OAS.Schema.Header (MediaType)

data RequestBody = RequestBody
  { description :: Maybe Text
  , content :: Map Text MediaType
  , required :: Maybe Bool
  }
  deriving (Show, Eq)

instance FromJSON RequestBody where
  parseJSON = withObject "RequestBody" \o ->
    RequestBody
      <$> o .:? "description"
      <*> o .: "content"
      <*> o .:? "required"

instance ToJSON RequestBody where
  toJSON RequestBody{..} = object
    [ "description" .= description
    , "content" .= content
    , "required" .= required
    ]
