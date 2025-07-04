{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.Sleeve where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative

import Types.CuffStyle (CuffStyle)
import Types.Type2 (Type2)

data Sleeve = Sleeve
  { cuffStyle :: [CuffStyle]
  , type_ :: [Type2]
  }
  deriving (Show, Eq)

instance FromJSON Sleeve where
  parseJSON = withObject "Sleeve" $ \obj -> do
    cuffStyle <- obj .: "cuff_style"
    type_ <- obj .: "type"
    pure $ Sleeve{..}

instance ToJSON Sleeve where
  toJSON Sleeve{..} =
    object [
      "cuff_style" .= cuffStyle,
      "type" .= type_
    ]
