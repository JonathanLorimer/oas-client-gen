{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.InvoiceCreditApplication where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data InvoiceCreditApplication = InvoiceCreditApplication
  { success :: Bool
  }
  deriving (Show, Eq)

instance FromJSON InvoiceCreditApplication where
  parseJSON = withObject "InvoiceCreditApplication" $ \obj -> do
    success <- obj .: "success"
    pure $ InvoiceCreditApplication{..}

instance ToJSON InvoiceCreditApplication where
  toJSON InvoiceCreditApplication{..} =
    object [
      "success" .= success
    ]
