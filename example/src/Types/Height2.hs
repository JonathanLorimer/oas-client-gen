{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Height2 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Height2 = Height2
  { unit :: Text
  , value :: Double
  }
  deriving (Show, Eq)

instance FromJSON Height2 where
  parseJSON = withObject "Height2" $ \obj -> do
    unit <- obj .: "unit"
    value <- obj .: "value"
    pure $ Height2{..}

instance ToJSON Height2 where
  toJSON Height2{..} =
    object [
      "unit" .= unit,
      "value" .= value
    ]
