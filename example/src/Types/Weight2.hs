{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Weight2 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Weight2 = Weight2
  { unit :: Text
  , value :: Double
  }
  deriving (Show, Eq)

instance FromJSON Weight2 where
  parseJSON = withObject "Weight2" $ \obj -> do
    unit <- obj .: "unit"
    value <- obj .: "value"
    pure $ Weight2{..}

instance ToJSON Weight2 where
  toJSON Weight2{..} =
    object [
      "unit" .= unit,
      "value" .= value
    ]
