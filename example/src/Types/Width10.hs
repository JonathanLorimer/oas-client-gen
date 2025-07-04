{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Width10 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Width10 = Width10
  { unit :: Text
  , value :: Double
  }
  deriving (Show, Eq)

instance FromJSON Width10 where
  parseJSON = withObject "Width10" $ \obj -> do
    unit <- obj .: "unit"
    value <- obj .: "value"
    pure $ Width10{..}

instance ToJSON Width10 where
  toJSON Width10{..} =
    object [
      "unit" .= unit,
      "value" .= value
    ]
