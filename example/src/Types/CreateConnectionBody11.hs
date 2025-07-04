{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.CreateConnectionBody11 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data CreateConnectionBody11 = CreateConnectionBody11
  { key :: Text
  , partnerId :: Text
  , shopId :: Text
  }
  deriving (Show, Eq)

instance FromJSON CreateConnectionBody11 where
  parseJSON = withObject "CreateConnectionBody11" $ \obj -> do
    key <- obj .: "key"
    partnerId <- obj .: "partner_id"
    shopId <- obj .: "shop_id"
    pure $ CreateConnectionBody11{..}

instance ToJSON CreateConnectionBody11 where
  toJSON CreateConnectionBody11{..} =
    object [
      "key" .= key,
      "partner_id" .= partnerId,
      "shop_id" .= shopId
    ]
