{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Invoice1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data Invoice1 = Invoice1
  { pdfLink :: Text
  }
  deriving (Show, Eq)

instance FromJSON Invoice1 where
  parseJSON = withObject "Invoice1" $ \obj -> do
    pdfLink <- obj .: "pdf_link"
    pure $ Invoice1{..}

instance ToJSON Invoice1 where
  toJSON Invoice1{..} =
    object [
      "pdf_link" .= pdfLink
    ]
