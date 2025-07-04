{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Subsidiaries2 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Subsidiaries2 = Subsidiaries2
  { id :: Text
  }
  deriving (Show, Eq)

instance FromJSON Subsidiaries2 where
  parseJSON = withObject "Subsidiaries2" $ \obj -> do
    id <- obj .: "id"
    pure $ Subsidiaries2{..}

instance ToJSON Subsidiaries2 where
  toJSON Subsidiaries2{..} =
    object [
      "id" .= id
    ]
