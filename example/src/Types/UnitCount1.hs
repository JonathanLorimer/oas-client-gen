{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.UnitCount1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.Type1 (Type1)

data UnitCount1 = UnitCount1
  { type_ :: Type1
  , value :: Text
  }
  deriving (Show, Eq)

instance FromJSON UnitCount1 where
  parseJSON = withObject "UnitCount1" $ \obj -> do
    type_ <- obj .: "type"
    value <- obj .: "value"
    pure $ UnitCount1{..}

instance ToJSON UnitCount1 where
  toJSON UnitCount1{..} =
    object [
      "type" .= type_,
      "value" .= value
    ]
