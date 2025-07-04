{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.BillCreditUnapplicationRequest where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.CreateBillCreditUnapplication (CreateBillCreditUnapplication)

data BillCreditUnapplicationRequest = BillCreditUnapplicationRequest
  { billCreditUnapplication :: CreateBillCreditUnapplication
  }
  deriving (Show, Eq)

instance FromJSON BillCreditUnapplicationRequest where
  parseJSON = withObject "BillCreditUnapplicationRequest" $ \obj -> do
    billCreditUnapplication <- obj .: "bill_credit_unapplication"
    pure $ BillCreditUnapplicationRequest{..}

instance ToJSON BillCreditUnapplicationRequest where
  toJSON BillCreditUnapplicationRequest{..} =
    object [
      "bill_credit_unapplication" .= billCreditUnapplication
    ]
