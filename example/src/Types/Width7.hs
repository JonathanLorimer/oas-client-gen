{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Width7 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Width7 = Width7
  { unit :: Text
  , value :: Double
  }
  deriving (Show, Eq)

instance FromJSON Width7 where
  parseJSON = withObject "Width7" $ \obj -> do
    unit <- obj .: "unit"
    value <- obj .: "value"
    pure $ Width7{..}

instance ToJSON Width7 where
  toJSON Width7{..} =
    object [
      "unit" .= unit,
      "value" .= value
    ]
