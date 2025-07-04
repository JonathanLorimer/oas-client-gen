{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Height11 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Height11 = Height11
  { unit :: Text
  , value :: Double
  }
  deriving (Show, Eq)

instance FromJSON Height11 where
  parseJSON = withObject "Height11" $ \obj -> do
    unit <- obj .: "unit"
    value <- obj .: "value"
    pure $ Height11{..}

instance ToJSON Height11 where
  toJSON Height11{..} =
    object [
      "unit" .= unit,
      "value" .= value
    ]
