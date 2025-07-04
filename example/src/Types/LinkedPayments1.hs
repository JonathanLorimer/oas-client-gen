{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.LinkedPayments1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data LinkedPayments1 = LinkedPayments1
  { id :: Text
  , type_ :: Text
  }
  deriving (Show, Eq)

instance FromJSON LinkedPayments1 where
  parseJSON = withObject "LinkedPayments1" $ \obj -> do
    id <- obj .: "id"
    type_ <- obj .: "type"
    pure $ LinkedPayments1{..}

instance ToJSON LinkedPayments1 where
  toJSON LinkedPayments1{..} =
    object [
      "id" .= id,
      "type" .= type_
    ]
