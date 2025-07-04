{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Height6 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Height6 = Height6
  { unit :: Text
  , value :: Double
  }
  deriving (Show, Eq)

instance FromJSON Height6 where
  parseJSON = withObject "Height6" $ \obj -> do
    unit <- obj .: "unit"
    value <- obj .: "value"
    pure $ Height6{..}

instance ToJSON Height6 where
  toJSON Height6{..} =
    object [
      "unit" .= unit,
      "value" .= value
    ]
