{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Width1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Width1 = Width1
  { unit :: Text
  , value :: Double
  }
  deriving (Show, Eq)

instance FromJSON Width1 where
  parseJSON = withObject "Width1" $ \obj -> do
    unit <- obj .: "unit"
    value <- obj .: "value"
    pure $ Width1{..}

instance ToJSON Width1 where
  toJSON Width1{..} =
    object [
      "unit" .= unit,
      "value" .= value
    ]
