{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Type3 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Type3 = Type3
  { value :: Text
  }
  deriving (Show, Eq)

instance FromJSON Type3 where
  parseJSON = withObject "Type3" $ \obj -> do
    value <- obj .: "value"
    pure $ Type3{..}

instance ToJSON Type3 where
  toJSON Type3{..} =
    object [
      "value" .= value
    ]
