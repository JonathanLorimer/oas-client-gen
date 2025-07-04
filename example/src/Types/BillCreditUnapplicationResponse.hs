{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.BillCreditUnapplicationResponse where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.BillCreditUnapplication (BillCreditUnapplication)

data BillCreditUnapplicationResponse = BillCreditUnapplicationResponse
  { billCreditUnapplication :: BillCreditUnapplication
  }
  deriving (Show, Eq)

instance FromJSON BillCreditUnapplicationResponse where
  parseJSON = withObject "BillCreditUnapplicationResponse" $ \obj -> do
    billCreditUnapplication <- obj .: "bill_credit_unapplication"
    pure $ BillCreditUnapplicationResponse{..}

instance ToJSON BillCreditUnapplicationResponse where
  toJSON BillCreditUnapplicationResponse{..} =
    object [
      "bill_credit_unapplication" .= billCreditUnapplication
    ]
