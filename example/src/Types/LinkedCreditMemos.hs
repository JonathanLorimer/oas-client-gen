{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.LinkedCreditMemos where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data LinkedCreditMemos = LinkedCreditMemos
  { allocatedAmount :: Double
  , allocatedDate :: Text
  , id :: Text
  }
  deriving (Show, Eq)

instance FromJSON LinkedCreditMemos where
  parseJSON = withObject "LinkedCreditMemos" $ \obj -> do
    allocatedAmount <- obj .: "allocated_amount"
    allocatedDate <- obj .: "allocated_date"
    id <- obj .: "id"
    pure $ LinkedCreditMemos{..}

instance ToJSON LinkedCreditMemos where
  toJSON LinkedCreditMemos{..} =
    object [
      "allocated_amount" .= allocatedAmount,
      "allocated_date" .= allocatedDate,
      "id" .= id
    ]
