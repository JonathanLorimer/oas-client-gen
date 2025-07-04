{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Capacity2 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Capacity2 = Capacity2
  { unit :: Text
  , value :: Double
  }
  deriving (Show, Eq)

instance FromJSON Capacity2 where
  parseJSON = withObject "Capacity2" $ \obj -> do
    unit <- obj .: "unit"
    value <- obj .: "value"
    pure $ Capacity2{..}

instance ToJSON Capacity2 where
  toJSON Capacity2{..} =
    object [
      "unit" .= unit,
      "value" .= value
    ]
