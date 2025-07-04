{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Length8 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Length8 = Length8
  { unit :: Text
  , value :: Double
  }
  deriving (Show, Eq)

instance FromJSON Length8 where
  parseJSON = withObject "Length8" $ \obj -> do
    unit <- obj .: "unit"
    value <- obj .: "value"
    pure $ Length8{..}

instance ToJSON Length8 where
  toJSON Length8{..} =
    object [
      "unit" .= unit,
      "value" .= value
    ]
