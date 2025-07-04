module Types.ValidationError where

import Data.Text (Text)
import Data.Aeson (FromJSON(..), ToJSON(..), (.=), (.:), (.:?), withObject, object)
import Data.Aeson.Types (Value(..), Parser, asum)
import GHC.Generics (Generic)

import Types.Location (Location)

data ValidationError = ValidationError
  { loc :: [Location]
  , msg :: Text
  , type :: Text
  }
  deriving (Show, Eq)

instance FromJSON ValidationError where
  parseJSON = withObject "ValidationError" $ \obj -> do
    loc <- obj .: "loc"
    msg <- obj .: "msg"
    type <- obj .: "type"
    pure $ ValidationError{..}

instance ToJSON ValidationError where
  toJSON ValidationError{..} =
    object [
      "loc" .= loc,
      "msg" .= msg,
      "type" .= type
    ]
