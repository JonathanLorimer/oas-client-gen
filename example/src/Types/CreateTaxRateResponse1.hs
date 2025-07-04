{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateTaxRateResponse1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.AsyncResponse38 (AsyncResponse38)

data CreateTaxRateResponse1 = CreateTaxRateResponse1
  { asyncResponse :: AsyncResponse38
  }
  deriving (Show, Eq)

instance FromJSON CreateTaxRateResponse1 where
  parseJSON = withObject "CreateTaxRateResponse1" $ \obj -> do
    asyncResponse <- obj .: "async_response"
    pure $ CreateTaxRateResponse1{..}

instance ToJSON CreateTaxRateResponse1 where
  toJSON CreateTaxRateResponse1{..} =
    object [
      "async_response" .= asyncResponse
    ]
