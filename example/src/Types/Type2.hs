{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Type2 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Type2 = Type2
  { value :: Text
  }
  deriving (Show, Eq)

instance FromJSON Type2 where
  parseJSON = withObject "Type2" $ \obj -> do
    value <- obj .: "value"
    pure $ Type2{..}

instance ToJSON Type2 where
  toJSON Type2{..} =
    object [
      "value" .= value
    ]
