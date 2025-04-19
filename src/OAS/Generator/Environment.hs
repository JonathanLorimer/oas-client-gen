-- |
--   Module      : OAS.Generator.Environment
--   Description : Types and functions for representing open-api schema components
--   Copyright   : (c) Jonathan Lorimer, 2025
--   License     : BSD3
--   Maintainer  : jonathanlorimer@pm.me
--
--   The open-api specification uses a "components" object for de-duplication. This
--   acts like an environment in a programming languages evaluator, so we represent
--   that here.
module OAS.Generator.Environment where

import Data.List.NonEmpty (NonEmpty)
import Data.List.NonEmpty qualified as NE
import Data.Map (Map)
import Data.Map qualified as M
import Data.Set (Set)
import Data.Set qualified as S
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

data FromRefRecError
  = MissingRef Ref
  | RefCycleDetected (NonEmpty Text)

fromRefRec :: forall a. Map Text (OrRef a) -> OrRef a -> Either FromRefRecError a
fromRefRec env = go S.empty []
 where
  go :: Set Text -> [Text] -> OrRef a -> Either FromRefRecError a
  go visited path = \case
    ByReference r
      | r.ref `S.member` visited ->
          -- We've detected a cycle - return the path
          Left . RefCycleDetected $ r.ref NE.:| reverse path
      | otherwise -> case M.lookup r.ref env of
          Nothing -> Left . MissingRef $ r
          Just s -> go (S.insert r.ref visited) (r.ref : path) s
    Direct s -> Right s
