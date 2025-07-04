{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CustomField where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.Options (Options)
import Types.Default (Default)
import Types.Default (Default)

data CustomField = CustomField
  { default_ :: Default
  , description :: Text
  , key :: Text
  , name :: Text
  , options :: [Options]
  , required :: Bool
  , type_ :: Text
  }
  deriving (Show, Eq)

instance FromJSON CustomField where
  parseJSON = withObject "CustomField" $ \obj -> do
    default_ <- obj .: "default"
    description <- obj .: "description"
    key <- obj .: "key"
    name <- obj .: "name"
    options <- obj .: "options"
    required <- obj .: "required"
    type_ <- obj .: "type"
    pure $ CustomField{..}

instance ToJSON CustomField where
  toJSON CustomField{..} =
    object [
      "default" .= default_,
      "description" .= description,
      "key" .= key,
      "name" .= name,
      "options" .= options,
      "required" .= required,
      "type" .= type_
    ]
