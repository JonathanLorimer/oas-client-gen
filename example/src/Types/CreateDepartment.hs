{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateDepartment where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data CreateDepartment = CreateDepartment
  { name :: Text
  , parentId :: Text
  }
  deriving (Show, Eq)

instance FromJSON CreateDepartment where
  parseJSON = withObject "CreateDepartment" $ \obj -> do
    name <- obj .: "name"
    parentId <- obj .: "parent_id"
    pure $ CreateDepartment{..}

instance ToJSON CreateDepartment where
  toJSON CreateDepartment{..} =
    object [
      "name" .= name,
      "parent_id" .= parentId
    ]
