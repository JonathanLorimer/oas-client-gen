{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Components where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Components = Components
  { isCompound :: Bool
  , isPurchasesTax :: Bool
  , isSalesTax :: Bool
  , name :: Text
  , rate :: Double
  }
  deriving (Show, Eq)

instance FromJSON Components where
  parseJSON = withObject "Components" $ \obj -> do
    isCompound <- obj .: "is_compound"
    isPurchasesTax <- obj .: "is_purchases_tax"
    isSalesTax <- obj .: "is_sales_tax"
    name <- obj .: "name"
    rate <- obj .: "rate"
    pure $ Components{..}

instance ToJSON Components where
  toJSON Components{..} =
    object [
      "is_compound" .= isCompound,
      "is_purchases_tax" .= isPurchasesTax,
      "is_sales_tax" .= isSalesTax,
      "name" .= name,
      "rate" .= rate
    ]
