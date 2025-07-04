{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Weight1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Weight1 = Weight1
  { unit :: Text
  , value :: Double
  }
  deriving (Show, Eq)

instance FromJSON Weight1 where
  parseJSON = withObject "Weight1" $ \obj -> do
    unit <- obj .: "unit"
    value <- obj .: "value"
    pure $ Weight1{..}

instance ToJSON Weight1 where
  toJSON Weight1{..} =
    object [
      "unit" .= unit,
      "value" .= value
    ]
