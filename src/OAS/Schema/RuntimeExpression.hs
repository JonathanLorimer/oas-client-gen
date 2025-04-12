{-# LANGUAGE StrictData #-}

module OAS.Schema.RuntimeExpression where

import Data.Aeson
import Data.Map.Strict (Map)
import Data.Text (Text)

-- TODO: implement the runtime expression language
-- https://swagger.io/specification/#runtime-expressions
newtype RuntimeExpression = RuntimeExpression {text :: Text}
  deriving newtype (Eq, Ord, Show, ToJSON, FromJSON, ToJSONKey, FromJSONKey)
