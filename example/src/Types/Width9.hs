{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Width9 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Width9 = Width9
  { unit :: Text
  , value :: Double
  }
  deriving (Show, Eq)

instance FromJSON Width9 where
  parseJSON = withObject "Width9" $ \obj -> do
    unit <- obj .: "unit"
    value <- obj .: "value"
    pure $ Width9{..}

instance ToJSON Width9 where
  toJSON Width9{..} =
    object [
      "unit" .= unit,
      "value" .= value
    ]
