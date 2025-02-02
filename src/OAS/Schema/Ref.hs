{-# LANGUAGE StrictData #-}

module OAS.Schema.Ref where

import Data.Text (Text)

data Ref = Ref
  { ref :: Text
  , summary :: Maybe Text
  , description :: Maybe Text
  }

data OrRef a = Direct a | ByReference Ref
