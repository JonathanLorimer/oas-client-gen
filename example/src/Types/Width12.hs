{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Width12 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Width12 = Width12
  { unit :: Text
  , value :: Double
  }
  deriving (Show, Eq)

instance FromJSON Width12 where
  parseJSON = withObject "Width12" $ \obj -> do
    unit <- obj .: "unit"
    value <- obj .: "value"
    pure $ Width12{..}

instance ToJSON Width12 where
  toJSON Width12{..} =
    object [
      "unit" .= unit,
      "value" .= value
    ]
