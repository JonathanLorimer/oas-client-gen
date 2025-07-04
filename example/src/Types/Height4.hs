{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Height4 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Height4 = Height4
  { unit :: Text
  , value :: Double
  }
  deriving (Show, Eq)

instance FromJSON Height4 where
  parseJSON = withObject "Height4" $ \obj -> do
    unit <- obj .: "unit"
    value <- obj .: "value"
    pure $ Height4{..}

instance ToJSON Height4 where
  toJSON Height4{..} =
    object [
      "unit" .= unit,
      "value" .= value
    ]
