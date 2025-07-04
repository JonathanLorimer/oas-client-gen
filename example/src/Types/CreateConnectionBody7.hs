{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateConnectionBody7 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data CreateConnectionBody7 = CreateConnectionBody7
  { basicPassword :: Text
  , basicUsername :: Text
  , storeUrl :: Text
  }
  deriving (Show, Eq)

instance FromJSON CreateConnectionBody7 where
  parseJSON = withObject "CreateConnectionBody7" $ \obj -> do
    basicPassword <- obj .: "basic_password"
    basicUsername <- obj .: "basic_username"
    storeUrl <- obj .: "store_url"
    pure $ CreateConnectionBody7{..}

instance ToJSON CreateConnectionBody7 where
  toJSON CreateConnectionBody7{..} =
    object [
      "basic_password" .= basicPassword,
      "basic_username" .= basicUsername,
      "store_url" .= storeUrl
    ]
