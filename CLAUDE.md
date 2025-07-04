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
  | OASMap                   -- Map Text Value for free-form objects
  | OASRef Text              -- Reference to a named type (for cycles)
```

#### Endpoint Representation
```haskell
data Endpoint = Endpoint
  { method :: StdMethod                    -- HTTP method
  , path :: Text                           -- URL path
  , requestType :: Maybe OASType           -- Request body type
  , responseType :: Map Natural SchemaResult  -- Response types by status code
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

The repository contains two main projects:

### 1. Client Generator Library (`oas-client-gen/`)
```
oas-client-gen/
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
│   │   ├── Environment.hs # Reference resolution
│   │   └── FileSystem/  # File generation utilities
│   │       ├── Endpoint.hs # Endpoint code generation
│   │       └── Utils.hs    # Type utilities
│   └── Aeson/
│       └── Modifiers.hs # JSON field name transformations
├── base/OAS/Base/       # Base types for generated clients
│   └── Endpoint.hs      # Runtime endpoint types
├── app/Main.hs          # CLI application
└── oas-client-gen.cabal # Cabal package definition
```

### 2. Example Generated Client (`example/`)
```
example/
├── openapi.json         # Example OpenAPI spec (2.9MB)
├── src/                 # Generated client code
│   ├── Types/           # Generated data types
│   │   ├── Account.hs
│   │   ├── Customer.hs
│   │   └── ... (940+ type modules)
│   └── Endpoints/       # Generated API endpoints
│       ├── Accounting/
│       ├── Banking/
│       └── ... (organized by API path)
├── example.cabal        # Generated project file
└── cabal.project        # Cabal configuration
```

### Root Level Files
```
├── flake.nix           # Nix development environment
├── flake.lock          # Nix dependency lock
├── cabal.project       # Multi-project Cabal configuration
├── fourmolu.yaml       # Code formatter configuration
├── hie.yaml            # Haskell IDE Engine configuration
├── CLAUDE.md           # This documentation
└── LICENSE             # Project license
```

## Key Features

### Implemented
- ✅ Complete OpenAPI 3.0 and 3.1 schema parsing
- ✅ Intermediate type system with dependency tracking
- ✅ Reference resolution (`$ref` handling) with cycle detection
- ✅ Module dependency graph generation
- ✅ Support for complex nested types
- ✅ Proper handling of optional fields and union types
- ✅ Haskell source code generation with proper imports
- ✅ Response type naming (prefixed with endpoint name)
- ✅ Support for OpenAPI 3.1 nullable types
- ✅ Name collision detection and resolution
- ✅ CLI tool for processing OpenAPI specs
- ✅ Language pragma generation (OverloadedRecordDot, etc.)
- ✅ Proper handling of references vs inline schemas

### Planned
- 🔄 HTTP client generation (using `servant-client` or similar)
- 🔄 Template customization for generated code
- 🔄 Support for more OpenAPI extensions

## Usage Example

### CLI Usage
```bash
# Generate client from OpenAPI spec
cabal run oas-client-gen -- ./api-spec.json ./output-dir

# From the example directory
cd example
rm -rf src/*
cabal run oas-client-gen -- ./openapi.json ./src
```

### Library Usage
```haskell
import OAS.Schema.OpenAPI (OpenAPISpec)
import OAS.Generator.Environment (constructEnvironment)
import OAS.Generator.Endpoint (fromPath)
import OAS.Generator.Module (makeModules)
import OAS.Generator.FileSystem (generateClient)

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

-- Generate the actual client files
generateClient "./output-dir" modules endpoints typeInfo
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

- Limited support for OpenAPI extensions
- Some advanced schema features may not be fully supported
- HTTP client generation not yet implemented
- No support for XML content types
- Limited support for complex authentication schemes

## Recent Progress

### Name Collision Resolution
- Implemented detection of name collisions between different schemas
- Referenced types (via `$ref`) always use their canonical names
- Inline schemas with conflicting names get numeric suffixes (e.g., `Subsidiaries1`, `Subsidiaries2`)
- Reduced type generation from 1189 to 940 types in the example project

### OpenAPI 3.1 Support
- Added support for nullable types using `type: ["string", "null"]` syntax
- Implemented `SchemaTypeValue` with `SingleType` and `MultipleTypes` variants
- Proper handling of free-form objects (`additionalProperties` without `properties`)

### Code Generation Improvements
- Response types now prefixed with endpoint name (e.g., `GetAccountResponse`)
- Automatic language pragma generation based on code usage
- Improved import generation with proper filtering of self-references
- Better handling of recursive types with `OASRef`

## Future Roadmap

1. **Phase 1**: ✅ Complete core type generation and module system
2. **Phase 2**: ✅ Implement Haskell source code generation
3. **Phase 2.5**: Robust type deduplication (see TODO.md)
   - Implement structural equality checking for schemas
   - Reduce duplicate type generation for identical inline schemas
   - Unify reference and inline representations of the same schema
4. **Phase 3**: Add HTTP client generation with popular libraries
5. **Phase 4**: Template system for customization
6. **Phase 5**: Extended OpenAPI feature support

## Important TODOs

- **Type Deduplication**: See `TODO.md` for detailed plan to implement structural equality checking and reduce the number of generated types from 940 to ~600-700
