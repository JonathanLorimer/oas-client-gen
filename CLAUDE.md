# CLAUDE.md - OpenAPI Client Generator

## Project Overview

This is a Haskell library that parses OpenAPI 3.0 specification documents and generates Haskell client code. The library converts OpenAPI schemas into intermediate Haskell types and can generate type-safe client libraries for HTTP APIs.

## Architecture

### Core Components

The project is structured around several key modules:

1. **Schema Parsing** (`src/OAS/Schema/`)
   - Parses OpenAPI 3.0 JSON specifications into Haskell types
   - Handles all major OpenAPI components: paths, operations, schemas, responses, etc.
   - Uses `deriving-aeson` for automatic JSON serialization/deserialization

2. **Type Generation** (`src/OAS/Generator/`)
   - Converts OpenAPI schemas to intermediate Haskell types (`OASType`)
   - Handles complex type relationships and dependencies
   - Generates modular code structure for better organization

3. **Code Generation** (planned)
   - Will generate actual Haskell source code from the intermediate representation
   - Module-based output for clean project structure

### Key Types

#### OASType (Intermediate Representation)
```haskell
data OASType
  = OASPrim OASPrimTy        -- String, Int, Float, Bool
  | OASArray OASType         -- Arrays/Lists
  | OASObject Record         -- JSON objects -> Haskell records
  | OASMaybe OASType         -- Optional fields
  | OASEnum Text [OASType]   -- Union types/enums
```

#### Endpoint Representation
```haskell
data Endpoint = Endpoint
  { method :: StdMethod                    -- HTTP method
  , path :: Text                           -- URL path
  , requestType :: Maybe OASType           -- Request body type
  , responseType :: Map ResponseType SchemaResult  -- Response types by status
  }
```

#### Module System
The generator creates a module dependency graph to organize generated code:
- `Types.*` modules for data types
- `Endpoints.*` modules for API operations
- Automatic dependency tracking and import generation

## Development Setup

### Prerequisites
- Nix (recommended) or GHC 9.x with Cabal
- The project uses Nix flakes for reproducible builds

### Using Nix (Recommended)
```bash
# Enter development shell
nix develop

# Build the project
nix build

# Run the executable
nix run
```

### Using Cabal Directly
```bash
# Install dependencies
cabal update
cabal install --dependencies-only

# Build
cabal build

# Run
cabal run oas-client-gen
```

## Project Structure

```
├── src/OAS/
│   ├── Schema/          # OpenAPI schema types
│   │   ├── OpenAPI.hs   # Root OpenAPI document
│   │   ├── Path.hs      # API paths and operations
│   │   ├── SchemaObject.hs  # JSON Schema definitions
│   │   └── ...
│   ├── Generator/       # Code generation logic
│   │   ├── OASType.hs   # Intermediate type representation
│   │   ├── Endpoint.hs  # API endpoint abstraction
│   │   ├── Module.hs    # Module dependency system
│   │   └── Environment.hs # Reference resolution
│   └── Aeson/
│       └── Modifiers.hs # JSON field name transformations
├── app/Main.hs          # Example usage
├── flake.nix           # Nix development environment
└── oas-client-gen.cabal # Cabal package definition
```

## Key Features

### Implemented
- ✅ Complete OpenAPI 3.0 schema parsing
- ✅ Intermediate type system with dependency tracking
- ✅ Reference resolution (`$ref` handling)
- ✅ Module dependency graph generation
- ✅ Support for complex nested types
- ✅ Proper handling of optional fields and union types

### Planned
- 🔄 Haskell source code generation
- 🔄 HTTP client generation (using `servant-client` or similar)
- 🔄 CLI tool for processing OpenAPI specs
- 🔄 Template customization for generated code

## Usage Example

```haskell
import OAS.Schema.OpenAPI (OpenAPISpec)
import OAS.Generator.Environment (constructEnvironment)
import OAS.Generator.Endpoint (fromPath)
import OAS.Generator.Module (makeModules)

-- Parse OpenAPI spec from JSON
spec <- parseOpenAPISpec "api-spec.json"

-- Create environment for reference resolution
let env = constructEnvironment spec.components

-- Extract endpoints and type information
(endpoints, typeInfo) <- runSchemaT $ do
  -- Process all paths to extract endpoints
  paths <- traverse (fromPath env) spec.paths
  return $ concat paths

-- Generate module structure
let modules = makeModules endpoints typeInfo

-- modules now contains:
-- - typeModule: Map from types to module paths
-- - typeDependencies: Dependency relationships
-- - endpointModule: Map from endpoints to module paths
-- - endpointDependencies: Type dependencies per endpoint
```

## Code Style and Conventions

### Language Extensions
The project uses modern Haskell with these key extensions:
- `OverloadedRecordDot` for clean record access
- `DuplicateRecordFields` for ergonomic field names
- `DerivingVia` with `deriving-aeson` for JSON instances
- `StrictData` for better performance

### Formatting
- Uses `fourmolu` for code formatting (config in `fourmolu.yaml`)
- 2-space indentation, 110 character line limit
- Leading commas and function arrows

### Error Handling
- Uses `SchemaT` monad transformer for schema processing errors
- Comprehensive error types for different failure modes
- Proper handling of circular references and missing dependencies

## Testing

```bash
# Run tests
cabal test

# Run with coverage
cabal test --enable-coverage
```

## Dependencies

### Core Dependencies
- `aeson` - JSON parsing and generation
- `deriving-aeson` - Automatic JSON instance derivation
- `containers` - Maps and Sets for tracking dependencies
- `text` - Text processing
- `http-types` - HTTP method types
- `casing` - String case conversions for generated names

### Development Dependencies
- `hedgehog` - Property-based testing
- `hspec` - BDD-style testing framework
- `pretty-simple` - Pretty printing for debugging

## Contributing

1. Code should follow the existing style (enforced by `fourmolu`)
2. Add tests for new functionality
3. Update this documentation for significant changes
4. Use semantic commit messages

## Known Limitations

- Currently only supports OpenAPI 3.0 (not 3.1)
- Code generation is not yet implemented
- Limited support for OpenAPI extensions
- Some advanced schema features may not be fully supported

## Future Roadmap

1. **Phase 1**: Complete core type generation and module system
2. **Phase 2**: Implement Haskell source code generation
3. **Phase 3**: Add HTTP client generation with popular libraries
4. **Phase 4**: CLI tool and template system for customization
5. **Phase 5**: Support for OpenAPI 3.1 and extensions
