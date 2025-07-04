{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateTaxRate where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AdditionalFields39 (AdditionalFields39)
import Types.Components1 (Components1)

data CreateTaxRate = CreateTaxRate
  { components :: [Components1]
  , name :: Text
  }
  deriving (Show, Eq)

instance FromJSON CreateTaxRate where
  parseJSON = withObject "CreateTaxRate" $ \obj -> do
    components <- obj .: "components"
    name <- obj .: "name"
    pure $ CreateTaxRate{..}

instance ToJSON CreateTaxRate where
  toJSON CreateTaxRate{..} =
    object [
      "components" .= components,
      "name" .= name
    ]
