{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Store where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Store = Store
  { defaultCurrency :: Maybe Text
  , email :: Text
  , id :: Text
  , storeName :: Text
  , url :: Text
  }
  deriving (Show, Eq)

instance FromJSON Store where
  parseJSON = withObject "Store" $ \obj -> do
    defaultCurrency <- obj .: "default_currency"
    email <- obj .: "email"
    id <- obj .: "id"
    storeName <- obj .: "store_name"
    url <- obj .: "url"
    pure $ Store{..}

instance ToJSON Store where
  toJSON Store{..} =
    object [
      "default_currency" .= defaultCurrency,
      "email" .= email,
      "id" .= id,
      "store_name" .= storeName,
      "url" .= url
    ]
