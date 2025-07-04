{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Length2 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Length2 = Length2
  { unit :: Text
  , value :: Double
  }
  deriving (Show, Eq)

instance FromJSON Length2 where
  parseJSON = withObject "Length2" $ \obj -> do
    unit <- obj .: "unit"
    value <- obj .: "value"
    pure $ Length2{..}

instance ToJSON Length2 where
  toJSON Length2{..} =
    object [
      "unit" .= unit,
      "value" .= value
    ]
