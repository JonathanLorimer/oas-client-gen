# oas-client-gen

Haskell library that parses OpenAPI 3.0 specs and generates type-safe Haskell client code.

## Key Design Decision: Granular Modules

Existing OpenAPI client generators dump all generated types and endpoints into a single file. This causes GHC compilation performance issues (long compile times, high memory usage) for large API specs. This project generates a **granular module graph** where each type and endpoint gets its own module, with automatic dependency tracking and import generation. This is the central architectural motivation.

## Build & Test

Nix flakes for reproducible builds. Uses `deriving-aeson` pinned to 0.2.10.

```bash
nix develop          # Dev shell (GHC, cabal, fourmolu, hls)
cabal build          # Build
cabal test           # Run tests (hspec + hedgehog + golden tests)
cabal run oas-client-gen  # Run against spec-samples/autocat-openapi.json
```

Use `jj` (not `git`) for all version control operations.

## Architecture

The pipeline flows: **OpenAPI JSON -> Schema types -> OASType IR -> Module graph -> Generated Haskell files**

### 1. Schema Parsing (`src/OAS/Schema/`)

Haskell types mirroring the OpenAPI 3.0 spec, parsed via `deriving-aeson` with `CustomJSON`. Entry point is `OpenAPISpec` in `OpenAPI.hs`.

Key patterns:
- **`OrRef a`** (`Ref.hs`): `Direct a | ByReference Ref` -- handles OpenAPI's `$ref` polymorphism by checking for `$ref` field presence during parsing
- **`deriving-aeson` modifiers** (`OAS.Aeson.Modifiers`): `ToLower`, `LowerFirst` for field name transformations. Combined with `StripPrefix`, `Rename`, `CamelToSnake` etc. to handle reserved keywords (`in`, `default`, `type`)
- **Manual `FromJSON`/`ToJSON`** on complex types: `SchemaObject` (54 fields), `Ref` (`$ref` syntax), `Items` (object or array), `AdditionalProperties` (bool or schema)

### 2. Intermediate Representation (`src/OAS/Generator/OASType.hs`)

```haskell
data OASType
  = OASPrim OASPrimTy        -- String, Int, Float, Bool
   | OASArray OASType         -- Arrays/Lists
   | OASObject Record         -- JSON objects -> Haskell records
   | OASMaybe OASType         -- Optional fields
   | OASEnum Text [OASType]   -- Union types/enums
   | OASMap                   -- Map Text Value for free-form objects
   | OASRef Text              -- Reference to a named type (for cycles)
```

`Key` carries both `json` (original) and `haskell` (camelCased) field names.

`SchemaT` monad (`ExceptT SchemaError (StateT TypeInfo m)`) threads type collection and error handling through schema processing. All discovered types accumulate in `TypeInfo` (a `Set OASType`).

### 3. Endpoints (`src/OAS/Generator/Endpoint.hs`)

Extracts endpoints from OpenAPI paths. Each endpoint has method, path, optional request type, and `ResponseTypeInfo`:
- **`UnaryType`**: Single response status
- **`SumType`**: Multiple status codes -> generates a Haskell sum type with per-status constructors

### 4. Module System (`src/OAS/Generator/Module.hs`)

Creates the granular module graph:
- Types -> `Types.{ConstructorName}` modules
- Endpoints -> `Endpoints.{PathSegments}` modules (path segments title-cased, braces stripped)
- Dependency tracking via `getDeps` (recursive field traversal) for automatic import generation

### 5. Code Generation (`src/OAS/Generator/FileSystem*.hs`)

- **`FileSystem.hs`**: Orchestrates directory creation, generates type modules (records with `FromJSON`/`ToJSON` instances), endpoint modules, and a `Client.hs` that re-exports everything
- **`FileSystem/Endpoint.hs`**: Generates endpoint definitions using the `OAS.Base.Endpoint` runtime type. Handles path parameter interpolation, request body encoding, and response parsing with status code dispatch
- **`FileSystem/PrettyPrint.hs`**: Formatting helpers for generated code
- **`FileSystem/Utils.hs`**: `getTypeName` and `getTypeReference` for OASType -> Haskell type syntax

### 6. Runtime Library (`base/OAS/Base/Endpoint.hs`)

Separate cabal library (`oas-client-base`) that generated code depends on:

```haskell
 data Endpoint = Endpoint
   { method :: StdMethod                    -- HTTP method
   , path :: Text                           -- URL path
   , requestType :: Maybe OASType           -- Request body type
   , responseType :: Map Natural SchemaResult  -- Response types by status code
  }
```
