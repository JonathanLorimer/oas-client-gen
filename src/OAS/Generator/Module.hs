-- |
--   Module      : OAS.Generator.Module
--   Description : Types and functions for tracking the generated module graph
--   Copyright   : (c) Jonathan Lorimer, 2025
--   License     : BSD3
--   Maintainer  : jonathanlorimer@pm.me
--
--   This module provides functions and types for keeping track of the 'OASType's and 'Endpoint's
--   defined in the open-api schema. Specifically it keeps track of their dependency relations
--   so that we can generate a more granular module graph, which is a benefit for organization
--   and aids GHC's compilation.
module OAS.Generator.Module where

import Data.Map (Map)
import Data.Map.Lazy qualified as M
import Data.Maybe
import Data.Set (Set)
import Data.Set qualified as S
import Data.Text (Text)
import Data.Text qualified as T
import OAS.Generator.Endpoint
import OAS.Generator.OASType

-- | The key top level type that represents all module and dependency information
data Modules = Modules
  { typeModule :: Map OASType [Text]
  -- ^ A map from type to Haskell module path name (which implicitly encodes directory structure)
  , typeDependencies :: Map OASType (Set OASType)
  -- ^ A dependency map, useful for determining which types need to be imported into the module
  -- that defines a parent type
  , endpointModule :: Map Endpoint [Text]
  -- ^ A map from endpoint to Haskell module path name
  , endpointDependencies :: Map Endpoint (Set OASType)
  -- ^ A dependency map, useful for determining which types need to be imported into the module
  -- that defines an endpoint
  }
  deriving (Eq, Ord, Show)

makeModules :: [Endpoint] -> TypeInfo -> Modules
makeModules eps tyInfo =
  Modules
    { typeModule = typeModule tyInfo.types
    , typeDependencies = typeDeps tyInfo.types
    , endpointModule = endpointModule eps
    , endpointDependencies = endpointDeps eps
    }

typeModule :: Set OASType -> Map OASType [Text]
typeModule = fmap ("Types" :) . foldr foldTypeModule M.empty . S.toList
 where
  foldTypeModule :: OASType -> Map OASType [Text] -> Map OASType [Text]
  foldTypeModule ty m = case ty of
    OASPrim _ -> m
    OASArray ty' -> m
    OASMaybe ty' -> m
    OASObject r -> M.insert ty [r.constructor] m
    OASEnum ctr tys -> M.insert ty [ctr] m

endpointModule :: [Endpoint] -> Map Endpoint [Text]
endpointModule = fmap ("Endpoints" :) . foldr foldEndpointModule M.empty
 where
  stripBraces :: T.Text -> T.Text
  stripBraces text =
    let
      withoutPrefix = fromMaybe text (T.stripPrefix "{" text)
      result = fromMaybe withoutPrefix (T.stripSuffix "}" withoutPrefix)
    in
      result

  foldEndpointModule :: Endpoint -> Map Endpoint [Text] -> Map Endpoint [Text]
  foldEndpointModule ep =
    let
      pathChunks =
        fmap (T.toTitle . stripBraces)
          . filter (/= "")
          $ T.split (== '/') ep.path
    in
      M.insert ep pathChunks

getDeps :: OASType -> Set OASType
getDeps = \case
  OASPrim _ -> S.empty
  OASArray ty -> getDeps ty
  OASMaybe ty -> getDeps ty
  ty@(OASObject r) -> S.insert ty (foldMap getDeps . M.elems $ r.fields)
  ty@(OASEnum ctr tys) -> S.insert ty (foldMap getDeps tys)

typeDeps :: Set OASType -> Map OASType (Set OASType)
typeDeps = foldr foldTypeDeps M.empty . S.toList
 where
  foldTypeDeps :: OASType -> Map OASType (Set OASType) -> Map OASType (Set OASType)
  foldTypeDeps ty m = case ty of
    OASPrim _ -> m
    ty' -> M.insert ty' (S.delete ty' (getDeps ty')) m

endpointDeps :: [Endpoint] -> Map Endpoint (Set OASType)
endpointDeps = foldr foldEndpointDeps M.empty
 where
  foldEndpointDeps :: Endpoint -> Map Endpoint (Set OASType) -> Map Endpoint (Set OASType)
  foldEndpointDeps ep =
    let
      reqDeps = maybe S.empty getDeps ep.requestType
      resDeps = foldMap getDeps $ flip mapMaybe (M.elems ep.responseType) \case
        Type t -> Just t
        EmptySchema -> Nothing
    in
      M.insert ep (reqDeps <> resDeps)
