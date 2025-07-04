{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Width6 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Width6 = Width6
  { unit :: Text
  , value :: Double
  }
  deriving (Show, Eq)

instance FromJSON Width6 where
  parseJSON = withObject "Width6" $ \obj -> do
    unit <- obj .: "unit"
    value <- obj .: "value"
    pure $ Width6{..}

instance ToJSON Width6 where
  toJSON Width6{..} =
    object [
      "unit" .= unit,
      "value" .= value
    ]
