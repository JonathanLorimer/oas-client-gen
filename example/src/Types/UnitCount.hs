{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.UnitCount where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.Type (Type)

data UnitCount = UnitCount
  { type_ :: Type
  , value :: Text
  }
  deriving (Show, Eq)

instance FromJSON UnitCount where
  parseJSON = withObject "UnitCount" $ \obj -> do
    type_ <- obj .: "type"
    value <- obj .: "value"
    pure $ UnitCount{..}

instance ToJSON UnitCount where
  toJSON UnitCount{..} =
    object [
      "type" .= type_,
      "value" .= value
    ]
