{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateInvoiceResponse1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AsyncResponse28 (AsyncResponse28)

data CreateInvoiceResponse1 = CreateInvoiceResponse1
  { asyncResponse :: AsyncResponse28
  }
  deriving (Show, Eq)

instance FromJSON CreateInvoiceResponse1 where
  parseJSON = withObject "CreateInvoiceResponse1" $ \obj -> do
    asyncResponse <- obj .: "async_response"
    pure $ CreateInvoiceResponse1{..}

instance ToJSON CreateInvoiceResponse1 where
  toJSON CreateInvoiceResponse1{..} =
    object [
      "async_response" .= asyncResponse
    ]
