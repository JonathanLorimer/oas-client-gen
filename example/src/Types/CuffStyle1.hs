{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CuffStyle1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data CuffStyle1 = CuffStyle1
  { value :: Text
  }
  deriving (Show, Eq)

instance FromJSON CuffStyle1 where
  parseJSON = withObject "CuffStyle1" $ \obj -> do
    value <- obj .: "value"
    pure $ CuffStyle1{..}

instance ToJSON CuffStyle1 where
  toJSON CuffStyle1{..} =
    object [
      "value" .= value
    ]
