{-# LANGUAGE StrictData #-}

module OAS.Schema.RequestBody where

import Data.Map.Strict (Map)
import Data.Text (Text)
import Deriving.Aeson
import OAS.Schema.Header (MediaType)

data RequestBody = RequestBody
  { description :: Text
  , content :: Map Text MediaType
  , required :: Bool
  }
  deriving (Show, Eq, Generic)
  deriving
    (FromJSON, ToJSON)
    via CustomJSON '[] RequestBody
