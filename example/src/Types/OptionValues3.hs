{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.OptionValues3 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data OptionValues3 = OptionValues3
  { name :: Text
  , value :: Text
  }
  deriving (Show, Eq)

instance FromJSON OptionValues3 where
  parseJSON = withObject "OptionValues3" $ \obj -> do
    name <- obj .: "name"
    value <- obj .: "value"
    pure $ OptionValues3{..}

instance ToJSON OptionValues3 where
  toJSON OptionValues3{..} =
    object [
      "name" .= name,
      "value" .= value
    ]
