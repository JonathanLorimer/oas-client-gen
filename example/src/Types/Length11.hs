{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Length11 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Length11 = Length11
  { unit :: Text
  , value :: Double
  }
  deriving (Show, Eq)

instance FromJSON Length11 where
  parseJSON = withObject "Length11" $ \obj -> do
    unit <- obj .: "unit"
    value <- obj .: "value"
    pure $ Length11{..}

instance ToJSON Length11 where
  toJSON Length11{..} =
    object [
      "unit" .= unit,
      "value" .= value
    ]
