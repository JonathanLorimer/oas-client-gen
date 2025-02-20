{-# LANGUAGE StrictData #-}

module OAS.Schema.Parameter where

import Data.Aeson.Types (Value)
import Data.Map.Strict (Map)
import Data.Text (Text)
import OAS.Schema.Example (Example)
import OAS.Schema.Header (MediaType)
import OAS.Schema.Ref (OrRef, Ref)
import OAS.Schema.SchemaObject (Schema)

data Location = Query | Header | Path | Cookie

data Parameter = Parameter
  { name :: Text
  , parameterIn :: Location
  , description :: Text
  , required :: Bool
  , deprecated :: Bool
  , allowEmptyValue :: Bool
  , serialization :: Serialization
  }

data Serialization
  = Content ParameterContent
  | Schema ParameterSchema

data SerializationStyle
  = Form
  | Simple
  | Matrix
  | Label
  | SpaceDelimited
  | PipeDelimited
  | DeepObject

data ParameterSchema = ParameterSchema
  { style :: SerializationStyle
  , explode :: Bool
  , allowReserved :: Bool
  , schema :: Schema
  , example :: Value
  , examples :: Map Text (OrRef Example)
  }

newtype ParameterContent = ParameterContent {content :: Map Text MediaType}
