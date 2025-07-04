{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Neck1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.NeckStyle1 (NeckStyle1)

data Neck1 = Neck1
  { neckStyle :: [NeckStyle1]
  }
  deriving (Show, Eq)

instance FromJSON Neck1 where
  parseJSON = withObject "Neck1" $ \obj -> do
    neckStyle <- obj .: "neck_style"
    pure $ Neck1{..}

instance ToJSON Neck1 where
  toJSON Neck1{..} =
    object [
      "neck_style" .= neckStyle
    ]
