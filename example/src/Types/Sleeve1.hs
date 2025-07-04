{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Sleeve1 where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.CuffStyle1 (CuffStyle1)
import Types.Type5 (Type5)

data Sleeve1 = Sleeve1
  { cuffStyle :: [CuffStyle1]
  , type_ :: [Type5]
  }
  deriving (Show, Eq)

instance FromJSON Sleeve1 where
  parseJSON = withObject "Sleeve1" $ \obj -> do
    cuffStyle <- obj .: "cuff_style"
    type_ <- obj .: "type"
    pure $ Sleeve1{..}

instance ToJSON Sleeve1 where
  toJSON Sleeve1{..} =
    object [
      "cuff_style" .= cuffStyle,
      "type" .= type_
    ]
