{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Frame1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.Material1 (Material1)
import Types.Type8 (Type8)

data Frame1 = Frame1
  { material :: [Material1]
  , type_ :: [Type8]
  }
  deriving (Show, Eq)

instance FromJSON Frame1 where
  parseJSON = withObject "Frame1" $ \obj -> do
    material <- obj .: "material"
    type_ <- obj .: "type"
    pure $ Frame1{..}

instance ToJSON Frame1 where
  toJSON Frame1{..} =
    object [
      "material" .= material,
      "type" .= type_
    ]
