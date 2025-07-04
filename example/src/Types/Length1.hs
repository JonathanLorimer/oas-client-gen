{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Length1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Length1 = Length1
  { unit :: Text
  , value :: Double
  }
  deriving (Show, Eq)

instance FromJSON Length1 where
  parseJSON = withObject "Length1" $ \obj -> do
    unit <- obj .: "unit"
    value <- obj .: "value"
    pure $ Length1{..}

instance ToJSON Length1 where
  toJSON Length1{..} =
    object [
      "unit" .= unit,
      "value" .= value
    ]
