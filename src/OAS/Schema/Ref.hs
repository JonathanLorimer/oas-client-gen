{-# LANGUAGE StrictData #-}

module OAS.Schema.Ref where

import Data.Aeson
import Data.Aeson.KeyMap qualified as KM
import Data.Text (Text)
import Deriving.Aeson

data Ref = Ref
  { ref :: Text
  , summary :: Maybe Text
  , description :: Maybe Text
  }
  deriving (Show, Eq, Generic)

instance FromJSON Ref where
  parseJSON = withObject "Ref" $ \o -> do
    ref' <- o .: "$ref"
    summary' <- o .:? "summary"
    description' <- o .:? "description"
    return $ Ref ref' summary' description'

instance ToJSON Ref where
  toJSON (Ref ref' summary' description') =
    object
      [ "$ref" .= ref'
      , "summary" .= summary'
      , "description" .= description'
      ]

data OrRef a = Direct a | ByReference Ref
  deriving (Eq, Show)

instance (FromJSON a) => FromJSON (OrRef a) where
  parseJSON v@(Object o) =
    if KM.member "$ref" o
      then ByReference <$> parseJSON v
      else Direct <$> parseJSON v
  parseJSON v = Direct <$> parseJSON v

instance (ToJSON a) => ToJSON (OrRef a) where
  toJSON (Direct a) = toJSON a
  toJSON (ByReference ref') = toJSON ref'
