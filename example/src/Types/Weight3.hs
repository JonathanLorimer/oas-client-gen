{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Weight3 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Weight3 = Weight3
  { unit :: Text
  , value :: Double
  }
  deriving (Show, Eq)

instance FromJSON Weight3 where
  parseJSON = withObject "Weight3" $ \obj -> do
    unit <- obj .: "unit"
    value <- obj .: "value"
    pure $ Weight3{..}

instance ToJSON Weight3 where
  toJSON Weight3{..} =
    object [
      "unit" .= unit,
      "value" .= value
    ]
