{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Width where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Width = Width
  { unit :: Text
  , value :: Double
  }
  deriving (Show, Eq)

instance FromJSON Width where
  parseJSON = withObject "Width" $ \obj -> do
    unit <- obj .: "unit"
    value <- obj .: "value"
    pure $ Width{..}

instance ToJSON Width where
  toJSON Width{..} =
    object [
      "unit" .= unit,
      "value" .= value
    ]
