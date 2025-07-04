{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateClass where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data CreateClass = CreateClass
  { name :: Text
  , parentId :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON CreateClass where
  parseJSON = withObject "CreateClass" $ \obj -> do
    name <- obj .: "name"
    parentId <- obj .: "parent_id"
    pure $ CreateClass{..}

instance ToJSON CreateClass where
  toJSON CreateClass{..} =
    object [
      "name" .= name,
      "parent_id" .= parentId
    ]
