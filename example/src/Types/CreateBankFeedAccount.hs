{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateBankFeedAccount where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AdditionalFields2 (AdditionalFields2)

data CreateBankFeedAccount = CreateBankFeedAccount
  { accountId :: Text
  , additionalFields :: AdditionalFields2
  , availableBalance :: Double
  , availableCredit :: Double
  , bankAccountNumber :: Text
  , bankAccountType :: Text
  , creditLimit :: Double
  , currencyCode :: Text
  , currentBalance :: Double
  , financeCharges :: Double
  , internalBankAccountId :: Text
  , lastStatementBalance :: Double
  , lastStatementDate :: Text
  , lineOfBusiness :: Text
  , minimumPaymentAmount :: Double
  , name :: Text
  , nextPaymentAmount :: Double
  , nextPaymentDate :: Text
  , parentBankFeedAccountId :: Text
  , pastDueAmount :: Double
  , purchasesApr :: Double
  , routingNumber :: Text
  , transactionStartDate :: Text
  }
  deriving (Show, Eq)

instance FromJSON CreateBankFeedAccount where
  parseJSON = withObject "CreateBankFeedAccount" $ \obj -> do
    accountId <- obj .: "account_id"
    additionalFields <- obj .: "additional_fields"
    availableBalance <- obj .: "available_balance"
    availableCredit <- obj .: "available_credit"
    bankAccountNumber <- obj .: "bank_account_number"
    bankAccountType <- obj .: "bank_account_type"
    creditLimit <- obj .: "credit_limit"
    currencyCode <- obj .: "currency_code"
    currentBalance <- obj .: "current_balance"
    financeCharges <- obj .: "finance_charges"
    internalBankAccountId <- obj .: "internal_bank_account_id"
    lastStatementBalance <- obj .: "last_statement_balance"
    lastStatementDate <- obj .: "last_statement_date"
    lineOfBusiness <- obj .: "line_of_business"
    minimumPaymentAmount <- obj .: "minimum_payment_amount"
    name <- obj .: "name"
    nextPaymentAmount <- obj .: "next_payment_amount"
    nextPaymentDate <- obj .: "next_payment_date"
    parentBankFeedAccountId <- obj .: "parent_bank_feed_account_id"
    pastDueAmount <- obj .: "past_due_amount"
    purchasesApr <- obj .: "purchases_apr"
    routingNumber <- obj .: "routing_number"
    transactionStartDate <- obj .: "transaction_start_date"
    pure $ CreateBankFeedAccount{..}

instance ToJSON CreateBankFeedAccount where
  toJSON CreateBankFeedAccount{..} =
    object [
      "account_id" .= accountId,
      "additional_fields" .= additionalFields,
      "available_balance" .= availableBalance,
      "available_credit" .= availableCredit,
      "bank_account_number" .= bankAccountNumber,
      "bank_account_type" .= bankAccountType,
      "credit_limit" .= creditLimit,
      "currency_code" .= currencyCode,
      "current_balance" .= currentBalance,
      "finance_charges" .= financeCharges,
      "internal_bank_account_id" .= internalBankAccountId,
      "last_statement_balance" .= lastStatementBalance,
      "last_statement_date" .= lastStatementDate,
      "line_of_business" .= lineOfBusiness,
      "minimum_payment_amount" .= minimumPaymentAmount,
      "name" .= name,
      "next_payment_amount" .= nextPaymentAmount,
      "next_payment_date" .= nextPaymentDate,
      "parent_bank_feed_account_id" .= parentBankFeedAccountId,
      "past_due_amount" .= pastDueAmount,
      "purchases_apr" .= purchasesApr,
      "routing_number" .= routingNumber,
      "transaction_start_date" .= transactionStartDate
    ]
