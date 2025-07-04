{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateCreateExpenseRequest where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AdditionalFields19 (AdditionalFields19)
import Types.AdditionalFields20 (AdditionalFields20)
import Types.CreateExpense (CreateExpense)
import Types.Item6 (Item6)
import Types.LineItems9 (LineItems9)

data CreateCreateExpenseRequest = CreateCreateExpenseRequest
  { expense :: CreateExpense
  , responseMode :: Text
  }
  deriving (Show, Eq)

instance FromJSON CreateCreateExpenseRequest where
  parseJSON = withObject "CreateCreateExpenseRequest" $ \obj -> do
    expense <- obj .: "expense"
    responseMode <- obj .: "response_mode"
    pure $ CreateCreateExpenseRequest{..}

instance ToJSON CreateCreateExpenseRequest where
  toJSON CreateCreateExpenseRequest{..} =
    object [
      "expense" .= expense,
      "response_mode" .= responseMode
    ]
