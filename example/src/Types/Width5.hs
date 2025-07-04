{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Width5 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Width5 = Width5
  { unit :: Text
  , value :: Double
  }
  deriving (Show, Eq)

instance FromJSON Width5 where
  parseJSON = withObject "Width5" $ \obj -> do
    unit <- obj .: "unit"
    value <- obj .: "value"
    pure $ Width5{..}

instance ToJSON Width5 where
  toJSON Width5{..} =
    object [
      "unit" .= unit,
      "value" .= value
    ]
