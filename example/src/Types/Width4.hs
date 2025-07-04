{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Width4 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Width4 = Width4
  { unit :: Text
  , value :: Double
  }
  deriving (Show, Eq)

instance FromJSON Width4 where
  parseJSON = withObject "Width4" $ \obj -> do
    unit <- obj .: "unit"
    value <- obj .: "value"
    pure $ Width4{..}

instance ToJSON Width4 where
  toJSON Width4{..} =
    object [
      "unit" .= unit,
      "value" .= value
    ]
