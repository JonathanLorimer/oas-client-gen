{-# LANGUAGE StrictData #-}

module OAS.Schema.Example where

import Data.Aeson
import Data.Aeson.Types (Value)
import Data.Maybe (catMaybes)
import Data.Text (Text)

data Example = Example
  { summary :: Maybe Text
  , description :: Maybe Text
  , value :: Maybe Value
  , externalValue :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON Example where
  parseJSON = withObject "Example" \o ->
    Example
      <$> o .:? "summary"
      <*> o .:? "description"
      <*> o .:? "value"
      <*> o .:? "externalValue"

instance ToJSON Example where
  toJSON Example{..} = object $ catMaybes
    [ ("summary" .=) <$> summary
    , ("description" .=) <$> description
    , ("value" .=) <$> value
    , ("externalValue" .=) <$> externalValue
    ]
