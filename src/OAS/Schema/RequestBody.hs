{-# LANGUAGE StrictData #-}

module OAS.Schema.RequestBody where

import Data.Map.Strict (Map)
import Data.Text (Text)
import OAS.Schema.Header (MediaType)

data RequestBody = RequestBody
  { description :: Text
  , content :: Map Text MediaType
  , required :: Bool
  }
