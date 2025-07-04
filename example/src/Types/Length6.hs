{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Length6 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Length6 = Length6
  { unit :: Text
  , value :: Double
  }
  deriving (Show, Eq)

instance FromJSON Length6 where
  parseJSON = withObject "Length6" $ \obj -> do
    unit <- obj .: "unit"
    value <- obj .: "value"
    pure $ Length6{..}

instance ToJSON Length6 where
  toJSON Length6{..} =
    object [
      "unit" .= unit,
      "value" .= value
    ]
