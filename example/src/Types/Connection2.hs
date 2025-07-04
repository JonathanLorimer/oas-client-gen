{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Connection2 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Connection2 = Connection2
  { accessToken :: Text
  , id :: Text
  , linkUrl :: Text
  , name :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON Connection2 where
  parseJSON = withObject "Connection2" $ \obj -> do
    accessToken <- obj .: "access_token"
    id <- obj .: "id"
    linkUrl <- obj .: "link_url"
    name <- obj .: "name"
    pure $ Connection2{..}

instance ToJSON Connection2 where
  toJSON Connection2{..} =
    object [
      "access_token" .= accessToken,
      "id" .= id,
      "link_url" .= linkUrl,
      "name" .= name
    ]
