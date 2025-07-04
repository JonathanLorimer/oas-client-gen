{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateConnectionBody5 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data CreateConnectionBody5 = CreateConnectionBody5
  { apiKey :: Text
  , storeUrl :: Text
  }
  deriving (Show, Eq)

instance FromJSON CreateConnectionBody5 where
  parseJSON = withObject "CreateConnectionBody5" $ \obj -> do
    apiKey <- obj .: "api_key"
    storeUrl <- obj .: "store_url"
    pure $ CreateConnectionBody5{..}

instance ToJSON CreateConnectionBody5 where
  toJSON CreateConnectionBody5{..} =
    object [
      "api_key" .= apiKey,
      "store_url" .= storeUrl
    ]
