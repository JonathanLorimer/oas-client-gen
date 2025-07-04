{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Height8 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Height8 = Height8
  { unit :: Text
  , value :: Double
  }
  deriving (Show, Eq)

instance FromJSON Height8 where
  parseJSON = withObject "Height8" $ \obj -> do
    unit <- obj .: "unit"
    value <- obj .: "value"
    pure $ Height8{..}

instance ToJSON Height8 where
  toJSON Height8{..} =
    object [
      "unit" .= unit,
      "value" .= value
    ]
