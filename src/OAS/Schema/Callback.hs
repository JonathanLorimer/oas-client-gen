{-# LANGUAGE StrictData #-}

module OAS.Schema.Callback where

import Data.Map.Strict (Map)
import Data.Text (Text)
import OAS.Schema.Path (Path)
import OAS.Schema.RuntimeExpression (RuntimeExpression)

type Callback = Map RuntimeExpression Path
