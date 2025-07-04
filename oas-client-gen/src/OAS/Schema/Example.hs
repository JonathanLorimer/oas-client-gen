{-# LANGUAGE StrictData #-}

module OAS.Schema.Example where

import Data.Aeson.Types (Value)
import Data.Text
import Deriving.Aeson

data Example = Example
  { summary :: Maybe Text
  , description :: Maybe Text
  , value :: Maybe Value
  , externalValue :: Maybe Text
  }
  deriving (Show, Eq, Generic)
  deriving
    (FromJSON, ToJSON)
    via CustomJSON '[OmitNothingFields] Example
