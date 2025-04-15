module OAS.Generator.Components where

import Data.Map (Map)
import Data.Text (Text)
import OAS.Schema.SchemaObject (Schema)

newtype Components = Components
  { schemaMap :: Map Text Schema
  }
