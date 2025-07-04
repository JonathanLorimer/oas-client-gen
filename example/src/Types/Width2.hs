{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Width2 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Width2 = Width2
  { unit :: Text
  , value :: Double
  }
  deriving (Show, Eq)

instance FromJSON Width2 where
  parseJSON = withObject "Width2" $ \obj -> do
    unit <- obj .: "unit"
    value <- obj .: "value"
    pure $ Width2{..}

instance ToJSON Width2 where
  toJSON Width2{..} =
    object [
      "unit" .= unit,
      "value" .= value
    ]
