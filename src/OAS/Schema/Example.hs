{-# LANGUAGE StrictData #-}

module OAS.Schema.Example where

import Data.Aeson.Types (Value)
import Data.Text

data Example = Example
  { summary :: Maybe Text
  , description :: Maybe Text
  , value :: Maybe Value
  , externalValue :: Maybe Text
  }
