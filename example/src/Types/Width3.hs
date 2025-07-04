{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Width3 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Width3 = Width3
  { unit :: Text
  , value :: Double
  }
  deriving (Show, Eq)

instance FromJSON Width3 where
  parseJSON = withObject "Width3" $ \obj -> do
    unit <- obj .: "unit"
    value <- obj .: "value"
    pure $ Width3{..}

instance ToJSON Width3 where
  toJSON Width3{..} =
    object [
      "unit" .= unit,
      "value" .= value
    ]
