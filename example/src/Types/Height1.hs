{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Height1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Height1 = Height1
  { unit :: Text
  , value :: Double
  }
  deriving (Show, Eq)

instance FromJSON Height1 where
  parseJSON = withObject "Height1" $ \obj -> do
    unit <- obj .: "unit"
    value <- obj .: "value"
    pure $ Height1{..}

instance ToJSON Height1 where
  toJSON Height1{..} =
    object [
      "unit" .= unit,
      "value" .= value
    ]
