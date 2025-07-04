{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AdditionalFields31 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data AdditionalFields31 = AdditionalFields31
  { editable :: Bool
  }
  deriving (Show, Eq)

instance FromJSON AdditionalFields31 where
  parseJSON = withObject "AdditionalFields31" $ \obj -> do
    editable <- obj .: "editable"
    pure $ AdditionalFields31{..}

instance ToJSON AdditionalFields31 where
  toJSON AdditionalFields31{..} =
    object [
      "editable" .= editable
    ]
