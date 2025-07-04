{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Length3 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Length3 = Length3
  { unit :: Text
  , value :: Double
  }
  deriving (Show, Eq)

instance FromJSON Length3 where
  parseJSON = withObject "Length3" $ \obj -> do
    unit <- obj .: "unit"
    value <- obj .: "value"
    pure $ Length3{..}

instance ToJSON Length3 where
  toJSON Length3{..} =
    object [
      "unit" .= unit,
      "value" .= value
    ]
