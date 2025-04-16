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

data Modules = Modules
  { typeModule :: Map OASType [Text]
  , typeDependencies :: Map OASType (Set OASType)
  , endpointModule :: Map Endpoint [Text]
  , endpointDependencies :: Map Endpoint (Set OASType)
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
