{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Closure1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.Type7 (Type7)

data Closure1 = Closure1
  { type_ :: [Type7]
  }
  deriving (Show, Eq)

instance FromJSON Closure1 where
  parseJSON = withObject "Closure1" $ \obj -> do
    type_ <- obj .: "type"
    pure $ Closure1{..}

instance ToJSON Closure1 where
  toJSON Closure1{..} =
    object [
      "type" .= type_
    ]
