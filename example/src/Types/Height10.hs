{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Height10 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Height10 = Height10
  { unit :: Text
  , value :: Double
  }
  deriving (Show, Eq)

instance FromJSON Height10 where
  parseJSON = withObject "Height10" $ \obj -> do
    unit <- obj .: "unit"
    value <- obj .: "value"
    pure $ Height10{..}

instance ToJSON Height10 where
  toJSON Height10{..} =
    object [
      "unit" .= unit,
      "value" .= value
    ]
