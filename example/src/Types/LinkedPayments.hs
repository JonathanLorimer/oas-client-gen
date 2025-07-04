{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.LinkedPayments where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data LinkedPayments = LinkedPayments
  { id :: Maybe Text
  , paymentAmount :: Double
  , type_ :: Text
  }
  deriving (Show, Eq)

instance FromJSON LinkedPayments where
  parseJSON = withObject "LinkedPayments" $ \obj -> do
    id <- obj .: "id"
    paymentAmount <- obj .: "payment_amount"
    type_ <- obj .: "type"
    pure $ LinkedPayments{..}

instance ToJSON LinkedPayments where
  toJSON LinkedPayments{..} =
    object [
      "id" .= id,
      "payment_amount" .= paymentAmount,
      "type" .= type_
    ]
