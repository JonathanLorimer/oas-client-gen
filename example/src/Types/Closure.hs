{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Closure where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.Type3 (Type3)

data Closure = Closure
  { type_ :: [Type3]
  }
  deriving (Show, Eq)

instance FromJSON Closure where
  parseJSON = withObject "Closure" $ \obj -> do
    type_ <- obj .: "type"
    pure $ Closure{..}

instance ToJSON Closure where
  toJSON Closure{..} =
    object [
      "type" .= type_
    ]
