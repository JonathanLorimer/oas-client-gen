{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Width8 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Width8 = Width8
  { unit :: Text
  , value :: Double
  }
  deriving (Show, Eq)

instance FromJSON Width8 where
  parseJSON = withObject "Width8" $ \obj -> do
    unit <- obj .: "unit"
    value <- obj .: "value"
    pure $ Width8{..}

instance ToJSON Width8 where
  toJSON Width8{..} =
    object [
      "unit" .= unit,
      "value" .= value
    ]
