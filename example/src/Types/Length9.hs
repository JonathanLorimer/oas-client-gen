{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Length9 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Length9 = Length9
  { unit :: Text
  , value :: Double
  }
  deriving (Show, Eq)

instance FromJSON Length9 where
  parseJSON = withObject "Length9" $ \obj -> do
    unit <- obj .: "unit"
    value <- obj .: "value"
    pure $ Length9{..}

instance ToJSON Length9 where
  toJSON Length9{..} =
    object [
      "unit" .= unit,
      "value" .= value
    ]
