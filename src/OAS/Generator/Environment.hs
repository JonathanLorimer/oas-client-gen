module OAS.Generator.Environment where

import Data.Map (Map)
import Data.Map qualified as M
import Data.Text (Text)
import Data.Text qualified as T
import OAS.Schema.Component (ComponentObject (..))
import OAS.Schema.Path (Path)
import OAS.Schema.Ref (OrRef (..), Ref (..))
import OAS.Schema.RequestBody (RequestBody)
import OAS.Schema.Response (Response)
import OAS.Schema.SchemaObject (Schema)

data Environment = Environment
  { schemas :: Map Text Schema
  , paths :: Map Text Path
  , requestBodies :: Map Text (OrRef RequestBody)
  , responses :: Map Text (OrRef Response)
  }
  deriving (Eq, Show)

constructEnvironment :: ComponentObject -> Environment
constructEnvironment co =
  Environment
    { schemas = maybe M.empty (M.mapKeys ("#/components/schemas/" <>)) co.schemas
    , paths = maybe M.empty (M.mapKeys ("#/components/paths/" <>)) co.pathItems
    , requestBodies = maybe M.empty (M.mapKeys ("#/components/requestBodies/" <>)) co.requestBodies
    , responses = maybe M.empty (M.mapKeys ("#/components/responses/" <>)) co.responses
    }

fromRef :: Map Text a -> OrRef a -> Either Ref a
fromRef env = \case
  ByReference r -> case M.lookup r.ref env of
    Nothing -> Left r
    Just s -> pure s
  Direct s -> pure s

-- | TODO: Add a simple infinite recursion counter here.
fromRefRec :: Map Text (OrRef a) -> OrRef a -> Either Ref a
fromRefRec env = \case
  ByReference r -> case M.lookup r.ref env of
    Nothing -> Left r
    Just s -> fromRefRec env s
  Direct s -> pure s
