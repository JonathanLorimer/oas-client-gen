{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Height3 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Height3 = Height3
  { unit :: Text
  , value :: Double
  }
  deriving (Show, Eq)

instance FromJSON Height3 where
  parseJSON = withObject "Height3" $ \obj -> do
    unit <- obj .: "unit"
    value <- obj .: "value"
    pure $ Height3{..}

instance ToJSON Height3 where
  toJSON Height3{..} =
    object [
      "unit" .= unit,
      "value" .= value
    ]
