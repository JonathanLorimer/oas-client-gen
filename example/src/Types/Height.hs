{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Height where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Height = Height
  { unit :: Text
  , value :: Double
  }
  deriving (Show, Eq)

instance FromJSON Height where
  parseJSON = withObject "Height" $ \obj -> do
    unit <- obj .: "unit"
    value <- obj .: "value"
    pure $ Height{..}

instance ToJSON Height where
  toJSON Height{..} =
    object [
      "unit" .= unit,
      "value" .= value
    ]
