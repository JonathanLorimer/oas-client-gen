{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateCreateDepartmentRequest where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.CreateDepartment (CreateDepartment)

data CreateCreateDepartmentRequest = CreateCreateDepartmentRequest
  { department :: CreateDepartment
  , responseMode :: Text
  }
  deriving (Show, Eq)

instance FromJSON CreateCreateDepartmentRequest where
  parseJSON = withObject "CreateCreateDepartmentRequest" $ \obj -> do
    department <- obj .: "department"
    responseMode <- obj .: "response_mode"
    pure $ CreateCreateDepartmentRequest{..}

instance ToJSON CreateCreateDepartmentRequest where
  toJSON CreateCreateDepartmentRequest{..} =
    object [
      "department" .= department,
      "response_mode" .= responseMode
    ]
