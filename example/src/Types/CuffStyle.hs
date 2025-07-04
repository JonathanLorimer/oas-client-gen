{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CuffStyle where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data CuffStyle = CuffStyle
  { value :: Text
  }
  deriving (Show, Eq)

instance FromJSON CuffStyle where
  parseJSON = withObject "CuffStyle" $ \obj -> do
    value <- obj .: "value"
    pure $ CuffStyle{..}

instance ToJSON CuffStyle where
  toJSON CuffStyle{..} =
    object [
      "value" .= value
    ]
