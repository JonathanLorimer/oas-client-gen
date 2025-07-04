{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.AdditionalFields17 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data AdditionalFields17 = AdditionalFields17
  { currencyCode :: Text
  , language :: Text
  , parentId :: Text
  }
  deriving (Show, Eq)

instance FromJSON AdditionalFields17 where
  parseJSON = withObject "AdditionalFields17" $ \obj -> do
    currencyCode <- obj .: "currency_code"
    language <- obj .: "language"
    parentId <- obj .: "parent_id"
    pure $ AdditionalFields17{..}

instance ToJSON AdditionalFields17 where
  toJSON AdditionalFields17{..} =
    object [
      "currency_code" .= currencyCode,
      "language" .= language,
      "parent_id" .= parentId
    ]
