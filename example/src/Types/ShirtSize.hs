{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ShirtSize where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data ShirtSize = ShirtSize
  { bodyType :: Maybe Text
  , heightType :: Maybe Text
  , size :: Maybe Text
  , sizeClass :: Maybe Text
  , sizeSystem :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON ShirtSize where
  parseJSON = withObject "ShirtSize" $ \obj -> do
    bodyType <- obj .: "body_type"
    heightType <- obj .: "height_type"
    size <- obj .: "size"
    sizeClass <- obj .: "size_class"
    sizeSystem <- obj .: "size_system"
    pure $ ShirtSize{..}

instance ToJSON ShirtSize where
  toJSON ShirtSize{..} =
    object [
      "body_type" .= bodyType,
      "height_type" .= heightType,
      "size" .= size,
      "size_class" .= sizeClass,
      "size_system" .= sizeSystem
    ]
