{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Neck where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.NeckStyle (NeckStyle)

data Neck = Neck
  { neckStyle :: [NeckStyle]
  }
  deriving (Show, Eq)

instance FromJSON Neck where
  parseJSON = withObject "Neck" $ \obj -> do
    neckStyle <- obj .: "neck_style"
    pure $ Neck{..}

instance ToJSON Neck where
  toJSON Neck{..} =
    object [
      "neck_style" .= neckStyle
    ]
