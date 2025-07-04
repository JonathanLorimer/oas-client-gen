{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.BillCreditUnapplication where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data BillCreditUnapplication = BillCreditUnapplication
  { id :: Text
  , success :: Bool
  }
  deriving (Show, Eq)

instance FromJSON BillCreditUnapplication where
  parseJSON = withObject "BillCreditUnapplication" $ \obj -> do
    id <- obj .: "id"
    success <- obj .: "success"
    pure $ BillCreditUnapplication{..}

instance ToJSON BillCreditUnapplication where
  toJSON BillCreditUnapplication{..} =
    object [
      "id" .= id,
      "success" .= success
    ]
