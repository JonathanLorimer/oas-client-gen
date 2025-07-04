{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Width11 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Width11 = Width11
  { unit :: Text
  , value :: Double
  }
  deriving (Show, Eq)

instance FromJSON Width11 where
  parseJSON = withObject "Width11" $ \obj -> do
    unit <- obj .: "unit"
    value <- obj .: "value"
    pure $ Width11{..}

instance ToJSON Width11 where
  toJSON Width11{..} =
    object [
      "unit" .= unit,
      "value" .= value
    ]
