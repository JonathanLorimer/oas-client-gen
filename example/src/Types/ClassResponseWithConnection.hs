{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ClassResponseWithConnection where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data ClassResponseWithConnection = ClassResponseWithConnection
  { class_ :: Class
  , connection :: Connection
  }
  deriving (Show, Eq)

instance FromJSON ClassResponseWithConnection where
  parseJSON = withObject "ClassResponseWithConnection" $ \obj -> do
    class_ <- obj .: "class"
    connection <- obj .: "connection"
    pure $ ClassResponseWithConnection{..}

instance ToJSON ClassResponseWithConnection where
  toJSON ClassResponseWithConnection{..} =
    object [
      "class" .= class_,
      "connection" .= connection
    ]
