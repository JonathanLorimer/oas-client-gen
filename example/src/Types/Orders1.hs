{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Orders1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Orders1 = Orders1
  { id :: Text
  }
  deriving (Show, Eq)

instance FromJSON Orders1 where
  parseJSON = withObject "Orders1" $ \obj -> do
    id <- obj .: "id"
    pure $ Orders1{..}

instance ToJSON Orders1 where
  toJSON Orders1{..} =
    object [
      "id" .= id
    ]
