{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateConnectionBody8 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data CreateConnectionBody8 = CreateConnectionBody8
  { basicPassword :: Text
  , basicUsername :: Text
  , storeUrl :: Text
  }
  deriving (Show, Eq)

instance FromJSON CreateConnectionBody8 where
  parseJSON = withObject "CreateConnectionBody8" $ \obj -> do
    basicPassword <- obj .: "basic_password"
    basicUsername <- obj .: "basic_username"
    storeUrl <- obj .: "store_url"
    pure $ CreateConnectionBody8{..}

instance ToJSON CreateConnectionBody8 where
  toJSON CreateConnectionBody8{..} =
    object [
      "basic_password" .= basicPassword,
      "basic_username" .= basicUsername,
      "store_url" .= storeUrl
    ]
