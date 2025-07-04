{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.NeckStyle1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data NeckStyle1 = NeckStyle1
  { value :: Text
  }
  deriving (Show, Eq)

instance FromJSON NeckStyle1 where
  parseJSON = withObject "NeckStyle1" $ \obj -> do
    value <- obj .: "value"
    pure $ NeckStyle1{..}

instance ToJSON NeckStyle1 where
  toJSON NeckStyle1{..} =
    object [
      "value" .= value
    ]
