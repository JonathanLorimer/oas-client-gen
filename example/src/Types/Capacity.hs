{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Capacity where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Capacity = Capacity
  { unit :: Text
  , value :: Double
  }
  deriving (Show, Eq)

instance FromJSON Capacity where
  parseJSON = withObject "Capacity" $ \obj -> do
    unit <- obj .: "unit"
    value <- obj .: "value"
    pure $ Capacity{..}

instance ToJSON Capacity where
  toJSON Capacity{..} =
    object [
      "unit" .= unit,
      "value" .= value
    ]
