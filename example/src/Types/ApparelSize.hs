{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ApparelSize where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data ApparelSize = ApparelSize
  { bodyType :: Maybe Text
  , heightType :: Maybe Text
  , size :: Maybe Text
  , sizeClass :: Maybe Text
  , sizeSystem :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON ApparelSize where
  parseJSON = withObject "ApparelSize" $ \obj -> do
    bodyType <- obj .: "body_type"
    heightType <- obj .: "height_type"
    size <- obj .: "size"
    sizeClass <- obj .: "size_class"
    sizeSystem <- obj .: "size_system"
    pure $ ApparelSize{..}

instance ToJSON ApparelSize where
  toJSON ApparelSize{..} =
    object [
      "body_type" .= bodyType,
      "height_type" .= heightType,
      "size" .= size,
      "size_class" .= sizeClass,
      "size_system" .= sizeSystem
    ]
