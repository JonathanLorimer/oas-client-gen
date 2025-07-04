{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Length4 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Length4 = Length4
  { unit :: Text
  , value :: Double
  }
  deriving (Show, Eq)

instance FromJSON Length4 where
  parseJSON = withObject "Length4" $ \obj -> do
    unit <- obj .: "unit"
    value <- obj .: "value"
    pure $ Length4{..}

instance ToJSON Length4 where
  toJSON Length4{..} =
    object [
      "unit" .= unit,
      "value" .= value
    ]
