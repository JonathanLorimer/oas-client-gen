{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Height7 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Height7 = Height7
  { unit :: Text
  , value :: Double
  }
  deriving (Show, Eq)

instance FromJSON Height7 where
  parseJSON = withObject "Height7" $ \obj -> do
    unit <- obj .: "unit"
    value <- obj .: "value"
    pure $ Height7{..}

instance ToJSON Height7 where
  toJSON Height7{..} =
    object [
      "unit" .= unit,
      "value" .= value
    ]
