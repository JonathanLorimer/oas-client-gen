{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Height5 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Height5 = Height5
  { unit :: Text
  , value :: Double
  }
  deriving (Show, Eq)

instance FromJSON Height5 where
  parseJSON = withObject "Height5" $ \obj -> do
    unit <- obj .: "unit"
    value <- obj .: "value"
    pure $ Height5{..}

instance ToJSON Height5 where
  toJSON Height5{..} =
    object [
      "unit" .= unit,
      "value" .= value
    ]
