{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Length5 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Length5 = Length5
  { unit :: Text
  , value :: Double
  }
  deriving (Show, Eq)

instance FromJSON Length5 where
  parseJSON = withObject "Length5" $ \obj -> do
    unit <- obj .: "unit"
    value <- obj .: "value"
    pure $ Length5{..}

instance ToJSON Length5 where
  toJSON Length5{..} =
    object [
      "unit" .= unit,
      "value" .= value
    ]
