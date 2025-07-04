{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateCreateClassRequest where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.CreateClass (CreateClass)

data CreateCreateClassRequest = CreateCreateClassRequest
  { class_ :: CreateClass
  , responseMode :: Text
  }
  deriving (Show, Eq)

instance FromJSON CreateCreateClassRequest where
  parseJSON = withObject "CreateCreateClassRequest" $ \obj -> do
    class_ <- obj .: "class"
    responseMode <- obj .: "response_mode"
    pure $ CreateCreateClassRequest{..}

instance ToJSON CreateCreateClassRequest where
  toJSON CreateCreateClassRequest{..} =
    object [
      "class" .= class_,
      "response_mode" .= responseMode
    ]
