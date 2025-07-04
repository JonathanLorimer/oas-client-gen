{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Frame where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.Material (Material)
import Types.Type4 (Type4)

data Frame = Frame
  { material :: [Material]
  , type_ :: [Type4]
  }
  deriving (Show, Eq)

instance FromJSON Frame where
  parseJSON = withObject "Frame" $ \obj -> do
    material <- obj .: "material"
    type_ <- obj .: "type"
    pure $ Frame{..}

instance ToJSON Frame where
  toJSON Frame{..} =
    object [
      "material" .= material,
      "type" .= type_
    ]
