{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.BankFeedAccount where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative
import Data.Map (Map)


data BankFeedAccount = BankFeedAccount
  { accountId :: Maybe Text
  , availableBalance :: Maybe Double
  , availableCredit :: Maybe Double
  , bankAccountNumber :: Maybe Text
  , bankAccountType :: Text
  , creditLimit :: Maybe Double
  , currencyCode :: Maybe Text
  , currentBalance :: Maybe Double
  , feedStatus :: Text
  , financeCharges :: Maybe Double
  , id :: Text
  , internalBankAccountId :: Maybe Text
  , lastStatementBalance :: Maybe Double
  , lastStatementDate :: Maybe Text
  , lastSyncedAt :: Text
  , lineOfBusiness :: Maybe Text
  , minimumPaymentAmount :: Maybe Double
  , name :: Maybe Text
  , nextPaymentAmount :: Maybe Double
  , nextPaymentDate :: Maybe Text
  , parentBankFeedAccountId :: Maybe Text
  , pastDueAmount :: Maybe Double
  , platformData :: Map Text Value
  , purchasesApr :: Maybe Double
  , routingNumber :: Maybe Text
  , transactionReady :: Bool
  , transactionStartDate :: Maybe Text
  }
  deriving (Show, Eq)

instance FromJSON BankFeedAccount where
  parseJSON = withObject "BankFeedAccount" $ \obj -> do
    accountId <- obj .: "account_id"
    availableBalance <- obj .: "available_balance"
    availableCredit <- obj .: "available_credit"
    bankAccountNumber <- obj .: "bank_account_number"
    bankAccountType <- obj .: "bank_account_type"
    creditLimit <- obj .: "credit_limit"
    currencyCode <- obj .: "currency_code"
    currentBalance <- obj .: "current_balance"
    feedStatus <- obj .: "feed_status"
    financeCharges <- obj .: "finance_charges"
    id <- obj .: "id"
    internalBankAccountId <- obj .: "internal_bank_account_id"
    lastStatementBalance <- obj .: "last_statement_balance"
    lastStatementDate <- obj .: "last_statement_date"
    lastSyncedAt <- obj .: "last_synced_at"
    lineOfBusiness <- obj .: "line_of_business"
    minimumPaymentAmount <- obj .: "minimum_payment_amount"
    name <- obj .: "name"
    nextPaymentAmount <- obj .: "next_payment_amount"
    nextPaymentDate <- obj .: "next_payment_date"
    parentBankFeedAccountId <- obj .: "parent_bank_feed_account_id"
    pastDueAmount <- obj .: "past_due_amount"
    platformData <- obj .: "platform_data"
    purchasesApr <- obj .: "purchases_apr"
    routingNumber <- obj .: "routing_number"
    transactionReady <- obj .: "transaction_ready"
    transactionStartDate <- obj .: "transaction_start_date"
    pure $ BankFeedAccount{..}

instance ToJSON BankFeedAccount where
  toJSON BankFeedAccount{..} =
    object [
      "account_id" .= accountId,
      "available_balance" .= availableBalance,
      "available_credit" .= availableCredit,
      "bank_account_number" .= bankAccountNumber,
      "bank_account_type" .= bankAccountType,
      "credit_limit" .= creditLimit,
      "currency_code" .= currencyCode,
      "current_balance" .= currentBalance,
      "feed_status" .= feedStatus,
      "finance_charges" .= financeCharges,
      "id" .= id,
      "internal_bank_account_id" .= internalBankAccountId,
      "last_statement_balance" .= lastStatementBalance,
      "last_statement_date" .= lastStatementDate,
      "last_synced_at" .= lastSyncedAt,
      "line_of_business" .= lineOfBusiness,
      "minimum_payment_amount" .= minimumPaymentAmount,
      "name" .= name,
      "next_payment_amount" .= nextPaymentAmount,
      "next_payment_date" .= nextPaymentDate,
      "parent_bank_feed_account_id" .= parentBankFeedAccountId,
      "past_due_amount" .= pastDueAmount,
      "platform_data" .= platformData,
      "purchases_apr" .= purchasesApr,
      "routing_number" .= routingNumber,
      "transaction_ready" .= transactionReady,
      "transaction_start_date" .= transactionStartDate
    ]
