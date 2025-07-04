{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Capacity1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Capacity1 = Capacity1
  { unit :: Text
  , value :: Double
  }
  deriving (Show, Eq)

instance FromJSON Capacity1 where
  parseJSON = withObject "Capacity1" $ \obj -> do
    unit <- obj .: "unit"
    value <- obj .: "value"
    pure $ Capacity1{..}

instance ToJSON Capacity1 where
  toJSON Capacity1{..} =
    object [
      "unit" .= unit,
      "value" .= value
    ]
