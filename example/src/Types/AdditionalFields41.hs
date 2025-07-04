{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AdditionalFields41 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data AdditionalFields41 = AdditionalFields41
  { tags :: Text
  }
  deriving (Show, Eq)

instance FromJSON AdditionalFields41 where
  parseJSON = withObject "AdditionalFields41" $ \obj -> do
    tags <- obj .: "tags"
    pure $ AdditionalFields41{..}

instance ToJSON AdditionalFields41 where
  toJSON AdditionalFields41{..} =
    object [
      "tags" .= tags
    ]
