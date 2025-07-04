{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Customer1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Customer1 = Customer1
  { email :: Text
  , firstName :: Text
  , lastName :: Text
  }
  deriving (Show, Eq)

instance FromJSON Customer1 where
  parseJSON = withObject "Customer1" $ \obj -> do
    email <- obj .: "email"
    firstName <- obj .: "first_name"
    lastName <- obj .: "last_name"
    pure $ Customer1{..}

instance ToJSON Customer1 where
  toJSON Customer1{..} =
    object [
      "email" .= email,
      "first_name" .= firstName,
      "last_name" .= lastName
    ]
