{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Height9 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Height9 = Height9
  { unit :: Text
  , value :: Double
  }
  deriving (Show, Eq)

instance FromJSON Height9 where
  parseJSON = withObject "Height9" $ \obj -> do
    unit <- obj .: "unit"
    value <- obj .: "value"
    pure $ Height9{..}

instance ToJSON Height9 where
  toJSON Height9{..} =
    object [
      "unit" .= unit,
      "value" .= value
    ]
