{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.UnitCount2 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.Type6 (Type6)

data UnitCount2 = UnitCount2
  { type_ :: Type6
  , value :: Text
  }
  deriving (Show, Eq)

instance FromJSON UnitCount2 where
  parseJSON = withObject "UnitCount2" $ \obj -> do
    type_ <- obj .: "type"
    value <- obj .: "value"
    pure $ UnitCount2{..}

instance ToJSON UnitCount2 where
  toJSON UnitCount2{..} =
    object [
      "type" .= type_,
      "value" .= value
    ]
