{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Length7 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Length7 = Length7
  { unit :: Text
  , value :: Double
  }
  deriving (Show, Eq)

instance FromJSON Length7 where
  parseJSON = withObject "Length7" $ \obj -> do
    unit <- obj .: "unit"
    value <- obj .: "value"
    pure $ Length7{..}

instance ToJSON Length7 where
  toJSON Length7{..} =
    object [
      "unit" .= unit,
      "value" .= value
    ]
