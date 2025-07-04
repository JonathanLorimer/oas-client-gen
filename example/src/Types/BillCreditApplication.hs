{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.BillCreditApplication where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data BillCreditApplication = BillCreditApplication
  { success :: Bool
  }
  deriving (Show, Eq)

instance FromJSON BillCreditApplication where
  parseJSON = withObject "BillCreditApplication" $ \obj -> do
    success <- obj .: "success"
    pure $ BillCreditApplication{..}

instance ToJSON BillCreditApplication where
  toJSON BillCreditApplication{..} =
    object [
      "success" .= success
    ]
