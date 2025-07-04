{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.ProductCategory where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data ProductCategory = ProductCategory
  { children :: [ProductCategory]
  , id :: Text
  , name :: Text
  }
  deriving (Show, Eq)

instance FromJSON ProductCategory where
  parseJSON = withObject "ProductCategory" $ \obj -> do
    children <- obj .: "children"
    id <- obj .: "id"
    name <- obj .: "name"
    pure $ ProductCategory{..}

instance ToJSON ProductCategory where
  toJSON ProductCategory{..} =
    object [
      "children" .= children,
      "id" .= id,
      "name" .= name
    ]
