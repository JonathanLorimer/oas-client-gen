{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Length where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Length = Length
  { unit :: Text
  , value :: Double
  }
  deriving (Show, Eq)

instance FromJSON Length where
  parseJSON = withObject "Length" $ \obj -> do
    unit <- obj .: "unit"
    value <- obj .: "value"
    pure $ Length{..}

instance ToJSON Length where
  toJSON Length{..} =
    object [
      "unit" .= unit,
      "value" .= value
    ]
