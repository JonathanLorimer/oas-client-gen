{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ShirtSize1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data ShirtSize1 = ShirtSize1
  { bodyType :: Maybe Text
  , heightType :: Maybe Text
  , size :: Maybe Text
  , sizeClass :: Maybe Text
  , sizeSystem :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON ShirtSize1 where
  parseJSON = withObject "ShirtSize1" $ \obj -> do
    bodyType <- obj .: "body_type"
    heightType <- obj .: "height_type"
    size <- obj .: "size"
    sizeClass <- obj .: "size_class"
    sizeSystem <- obj .: "size_system"
    pure $ ShirtSize1{..}

instance ToJSON ShirtSize1 where
  toJSON ShirtSize1{..} =
    object [
      "body_type" .= bodyType,
      "height_type" .= heightType,
      "size" .= size,
      "size_class" .= sizeClass,
      "size_system" .= sizeSystem
    ]
