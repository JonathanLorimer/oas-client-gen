{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateInvoiceCreditApplicationResponse1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AsyncResponse23 (AsyncResponse23)

data CreateInvoiceCreditApplicationResponse1 = CreateInvoiceCreditApplicationResponse1
  { asyncResponse :: AsyncResponse23
  }
  deriving (Show, Eq)

instance FromJSON CreateInvoiceCreditApplicationResponse1 where
  parseJSON = withObject "CreateInvoiceCreditApplicationResponse1" $ \obj -> do
    asyncResponse <- obj .: "async_response"
    pure $ CreateInvoiceCreditApplicationResponse1{..}

instance ToJSON CreateInvoiceCreditApplicationResponse1 where
  toJSON CreateInvoiceCreditApplicationResponse1{..} =
    object [
      "async_response" .= asyncResponse
    ]
