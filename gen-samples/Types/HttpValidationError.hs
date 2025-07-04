module Types.HttpValidationError where

import Data.Text (Text)
import Data.Aeson (FromJSON(..), ToJSON(..), (.=), (.:), (.:?), withObject, object)
import Data.Aeson.Types (Value(..), Parser, asum)
import GHC.Generics (Generic)

import Types.ValidationError (ValidationError)
import Types.Location (Location)

data HttpValidationError = HttpValidationError
  { detail :: [ValidationError]
  }
  deriving (Show, Eq)

instance FromJSON HttpValidationError where
  parseJSON = withObject "HttpValidationError" $ \obj -> do
    detail <- obj .: "detail"
    pure $ HttpValidationError{..}

instance ToJSON HttpValidationError where
  toJSON HttpValidationError{..} =
    object [
      "detail" .= detail
    ]
