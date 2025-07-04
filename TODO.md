# TODO: Robust Type Deduplication System

## Problem Statement

The current type generation system is producing too many duplicate types because:

1. **Inline schemas with identical structure** are treated as separate types
2. **Reference tracking** only prevents duplicates for the exact same `$ref`, not for structurally identical schemas
3. **Name collision resolution** creates numbered variants even when the schemas are identical
4. **No structural equality checking** - we generate `Subsidiaries1`, `Subsidiaries2`, etc. even if they have the exact same fields

Current stats from the example project:
- 940 total types generated
- 6 Subsidiaries variants (likely some are identical)
- 6 Addresses variants (likely some are identical)
- Many inline schemas that could be deduplicated

## Proposed Solution

### 1. Implement Structural Hashing for OASType

Create a canonical hash/fingerprint for each OASType that captures its structure:

```haskell
-- Pseudo-code
typeFingerprint :: OASType -> Text
typeFingerprint = \case
  OASPrim prim -> "prim:" <> show prim
  OASArray inner -> "array:" <> typeFingerprint inner
  OASObject record -> "object:" <> hashRecord record
  OASMaybe inner -> "maybe:" <> typeFingerprint inner
  OASEnum name variants -> "enum:" <> name <> ":" <> hashVariants variants
  OASMap -> "map"
  OASRef name -> "ref:" <> name

hashRecord :: Record -> Text
-- Sort fields by name and hash their types
-- This ensures {a: String, b: Int} == {b: Int, a: String}

hashVariants :: [OASType] -> Text
-- Sort variants by their fingerprint for consistent hashing
```

### 2. Enhanced TypeInfo State

Update the `TypeInfo` type to track:

```haskell
data TypeInfo = TypeInfo
  { types :: Set OASType
  , usedNames :: Set Text
  , typesByFingerprint :: Map Text OASType  -- Fingerprint -> Canonical type
  , namesByFingerprint :: Map Text Text     -- Fingerprint -> Assigned name
  , refToFingerprint :: Map Text Text       -- Reference path -> Fingerprint
  }
```

### 3. Type Generation Algorithm

When generating a type:

1. **Calculate fingerprint** of the schema
2. **Check if we've seen this fingerprint before**:
   - If yes: return the existing type (either OASRef or the type itself)
   - If no: continue to step 3
3. **Determine the name**:
   - For references: use the canonical reference name
   - For inline schemas: use the hint, but check for collisions
4. **Register the type** with its fingerprint
5. **Store the mapping** from fingerprint to type

### 4. Special Cases to Handle

1. **Recursive types**: The fingerprint calculation needs to handle cycles
   - Use the type name as a placeholder during recursive fingerprint calculation
   
2. **Field order independence**: 
   - Sort object fields before hashing
   - Sort enum variants before hashing

3. **Reference consistency**:
   - A schema accessed via `$ref` and the same schema inline should have the same fingerprint

4. **Name preferences**:
   - When multiple names map to the same fingerprint, prefer:
     1. Reference names (from `$ref`)
     2. Explicit schema titles
     3. Field name hints
     4. Generated names with numbers

### 5. Implementation Steps

1. **Add fingerprinting function** to OASType module
2. **Update TypeInfo** with new tracking maps
3. **Modify fromSchemaWithVisited** to:
   - Calculate fingerprints before generating types
   - Check for existing types by fingerprint
   - Reuse existing types when possible
4. **Update name collision logic** to consider structural equality
5. **Add tests** for deduplication scenarios

### 6. Expected Improvements

With this system:
- Identical inline schemas will map to the same type
- Reference and inline versions of the same schema will be unified
- Total type count should reduce significantly (estimate: 940 → ~600-700)
- Cleaner generated code with fewer redundant types

### 7. Backwards Compatibility

- Generated type names might change (should stabilize after implementation)
- Module structure remains the same
- API compatibility maintained

## Alternative Approaches Considered

1. **Post-processing deduplication**: Generate all types then merge identical ones
   - Pros: Simpler to implement
   - Cons: More complex refactoring step, harder to maintain consistency

2. **Canonical schema representation**: Convert all schemas to a normal form first
   - Pros: Cleaner separation of concerns
   - Cons: Additional transformation layer, potential information loss

3. **Content-addressable types**: Use the fingerprint as the type name
   - Pros: Guarantees uniqueness
   - Cons: Unreadable type names, poor developer experience

## Next Steps

1. Implement fingerprinting for simple types (primitives, arrays, maybes)
2. Implement fingerprinting for objects with field sorting
3. Test with the example project to measure improvement
4. Handle edge cases (recursive types, complex enums)
5. Document the deduplication behavior