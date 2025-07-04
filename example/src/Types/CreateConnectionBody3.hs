{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateConnectionBody3 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data CreateConnectionBody3 = CreateConnectionBody3
  { basicPassword :: Text
  , basicUsername :: Text
  , storeUrl :: Text
  }
  deriving (Show, Eq)

instance FromJSON CreateConnectionBody3 where
  parseJSON = withObject "CreateConnectionBody3" $ \obj -> do
    basicPassword <- obj .: "basic_password"
    basicUsername <- obj .: "basic_username"
    storeUrl <- obj .: "store_url"
    pure $ CreateConnectionBody3{..}

instance ToJSON CreateConnectionBody3 where
  toJSON CreateConnectionBody3{..} =
    object [
      "basic_password" .= basicPassword,
      "basic_username" .= basicUsername,
      "store_url" .= storeUrl
    ]
