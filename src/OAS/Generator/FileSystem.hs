-- |
--   Module      : OAS.Generator.FileSystem
--   Description : Functions for generating files and directory structure
--   Copyright   : (c) Jonathan Lorimer, 2025
--   License     : BSD3
--   Maintainer  : jonathanlorimer@pm.me
--
--   This module provides functions for generating files and directory structure
--   based on the module graph defined by the `Modules` type. It handles creating
--   directories, writing files, and ensuring proper imports and exports.
module OAS.Generator.FileSystem where

import Control.Monad (forM_, when)
import Data.Char qualified as Char
import Data.Map qualified as M
import Data.Maybe (fromMaybe, mapMaybe)
import Data.Set qualified as S
import Data.Text (Text)
import Data.Text qualified as T
import Data.Text.IO qualified as TIO
import Network.HTTP.Types qualified as HTTP
import OAS.Generator.Endpoint (Endpoint (..))
import OAS.Generator.FileSystem.Endpoint (generateEndpointDefinition)
import OAS.Generator.FileSystem.Utils (getTypeName, getTypeReference)
import OAS.Generator.Module (Modules (..))
import OAS.Generator.OASType (Key (..), OASPrimTy (..), OASType (..), Record (..), SchemaResult (..))
import OAS.Schema.Response (ResponseType (..))
import System.Directory (createDirectoryIfMissing)
import System.FilePath (takeDirectory, (</>))

-- | Root directory for generated code
newtype OutputDir = OutputDir FilePath

-- | Generate files and directories based on the module structure
generateFiles :: OutputDir -> Modules -> IO ()
generateFiles (OutputDir rootDir) modules = do
  -- Create base directories
  createDirectoryIfMissing True (rootDir </> "Types")
  createDirectoryIfMissing True (rootDir </> "Endpoints")

  -- Generate type modules
  forM_ (M.toList modules.typeModule) $ \(oasType, modulePath) ->
    case generateTypeDefinition oasType of
      Nothing -> pure ()
      Just typeCode -> do
        let
          filePath = makeFilePath rootDir modulePath
        createDirectoryIfMissing True (takeDirectory filePath)

        -- Generate imports based on dependencies
        let
          deps = fromMaybe S.empty $ M.lookup oasType modules.typeDependencies
          imports = generateTypeImports modules deps

        -- Generate type definition

        -- Create the full module content and write to file
        let
          moduleContent = generateModuleContent modulePath imports typeCode
        TIO.writeFile filePath moduleContent

  -- Generate endpoint modules
  forM_ (M.toList modules.endpointModule) $ \(endpoint, modulePath) -> do
    let
      filePath = makeFilePath rootDir modulePath
    createDirectoryIfMissing True (takeDirectory filePath)

    -- Generate imports based on endpoint dependencies
    let
      deps = fromMaybe S.empty $ M.lookup endpoint modules.endpointDependencies
      imports = generateEndpointImports modules deps

    -- Generate endpoint definition
    let
      endpointCode = generateEndpointDefinition endpoint

    -- Create the full module content and write to file
    let
      moduleContent = generateModuleContent modulePath imports endpointCode
    TIO.writeFile filePath moduleContent

  -- Generate client module that exports everything
  generateClientModule rootDir modules

-- | Convert a module path to a file path
makeFilePath :: FilePath -> [Text] -> FilePath
makeFilePath rootDir modulePath =
  rootDir </> foldl (</>) "" (map T.unpack modulePath) <> ".hs"

-- | Generate import statements for module dependencies
generateTypeImports :: Modules -> S.Set OASType -> Text
generateTypeImports modules deps =
  let
    baseImports =
      T.unlines
        [ "import Data.Text (Text)"
        , "import Data.Aeson (FromJSON(..), ToJSON(..), (.=), (.:), (.:?), withObject, object)"
        , "import Data.Aeson.Types (Value(..), Parser, asum)"
        , "import GHC.Generics (Generic)"
        ]

    -- Type-specific imports
    typeImports = T.unlines . mapMaybe (makeTypeImport modules) . S.toList $ deps
  in
    baseImports <> "\n" <> typeImports

-- | Generate import statements for endpoint modules
generateEndpointImports :: Modules -> S.Set OASType -> Text
generateEndpointImports modules deps =
  let
    -- Standard imports required for endpoints
    stdImports =
      T.unlines
        [ "import Data.Text (Text)"
        , "import qualified Data.Text as T"
        , "import Data.Foldable (fold)"
        , "import Data.Bifunctor (first, bimap)"
        , "import qualified Data.Aeson as A"
        , "import qualified Data.ByteString.Lazy as L"
        , "import OAS.Base.Endpoint (Endpoint(..), FromResponseError(..))"
        , "import qualified Network.HTTP.Types as HTTP"
        ]

    -- Type-specific imports
    typeImports = T.unlines . mapMaybe (makeTypeImport modules) . S.toList $ deps
  in
    stdImports <> "\n" <> typeImports

-- | Create an import statement for a specific type
makeTypeImport :: Modules -> OASType -> Maybe Text
makeTypeImport modules ty = do
  modulePath <- M.lookup ty modules.typeModule
  tyName <- getTypeName ty
  pure $ "import " <> T.intercalate "." modulePath <> " (" <> tyName <> ")"

-- | Generate the complete module content
generateModuleContent :: [Text] -> Text -> Text -> Text
generateModuleContent modulePath imports code =
  let
    -- Module declaration
    moduleDecl = "module " <> T.intercalate "." modulePath <> " where\n\n"
  in
    moduleDecl <> imports <> "\n" <> code

-- | Generate Haskell code for a type definition
generateTypeDefinition :: OASType -> Maybe Text
generateTypeDefinition = \case
  OASPrim _ -> Nothing
  OASArray _ -> Nothing
  OASMaybe _ -> Nothing
  OASObject record -> Just $ generateRecordDefinition record
  OASEnum name types -> Just $ generateEnumDefinition name types

-- | Generate a record type definition
generateRecordDefinition :: Record -> Text
generateRecordDefinition record =
  T.unlines $
    [ "data " <> record.constructor <> " = " <> record.constructor
    , "  { " <> fields
    , "  }"
    , "  deriving (Show, Eq)"
    ]
      ++ generateFromJSONInstance record
      ++ generateToJSONInstance record
 where
  fields = T.intercalate "\n  , " $ map formatField $ M.toList record.fields

  formatField :: (Key, OASType) -> Text
  formatField (key, fieldType) =
    key.haskell <> " :: " <> getTypeReference fieldType

-- | Generate a FromJSON instance for a record
generateFromJSONInstance :: Record -> [Text]
generateFromJSONInstance record =
  [ ""
  , "instance FromJSON " <> record.constructor <> " where"
  , "  parseJSON = withObject \"" <> record.constructor <> "\" $ \\obj -> do"
  ]
    ++ fieldParsers
    ++ [ "    pure $ " <> record.constructor <> "{..}"
       ]
 where
  fieldParsers = map makeFieldParser $ M.toList record.fields

  makeFieldParser :: (Key, OASType) -> Text
  makeFieldParser (key, _) =
    "    " <> key.haskell <> " <- obj .: \"" <> key.json <> "\""

-- | Generate a ToJSON instance for a record
generateToJSONInstance :: Record -> [Text]
generateToJSONInstance record =
  [ ""
  , "instance ToJSON " <> record.constructor <> " where"
  , "  toJSON " <> record.constructor <> "{..} ="
  , "    object ["
  ]
    ++ fieldSerializers
    ++ [ "    ]"
       ]
 where
  fieldList = M.toList record.fields
  fieldSerializers = zipWith makeFieldSerializer fieldList [1 .. (length fieldList)]

  makeFieldSerializer :: (Key, OASType) -> Int -> Text
  makeFieldSerializer (key, _) i =
    "      \""
      <> key.json
      <> "\" .= "
      <> key.haskell
      <> (if i < length fieldList then "," else "")

-- | Generate an enum type definition
generateEnumDefinition :: Text -> [OASType] -> Text
generateEnumDefinition name types =
  T.unlines $
    [ "data " <> name
    , "  = " <> constructors
    , "  deriving (Show, Eq, Generic)"
    ]
      ++ generateEnumFromJSONInstance name types
      ++ generateEnumToJSONInstance name types
 where
  -- Create constructors for each variant
  constructors =
    T.intercalate "\n  | " $
      zipWith makeConstructor [1 ..] types

  -- Create a constructor with proper naming and appropriate field
  makeConstructor :: Int -> OASType -> Text
  makeConstructor i ty =
    let
      constructorName = name <> "Variant" <> T.pack (show i)
    in
      constructorName <> " " <> getTypeReference ty

generateEnumFromJSONInstance :: Text -> [OASType] -> [Text]
generateEnumFromJSONInstance name types =
  [ ""
  , "instance FromJSON " <> name <> " where"
  , "  parseJSON value = asum"
  , "    [ " <> T.intercalate "\n    , " variantParsers
  , "    ]"
  ]
 where
  variantParsers = zipWith makeVariantParser [1 ..] types

  makeVariantParser :: Int -> OASType -> Text
  makeVariantParser i _ =
    let
      constructorName = name <> "Variant" <> T.pack (show i)
    in
      constructorName <> " <$> parseJSON value"

-- | Generate a ToJSON instance for an enum type
generateEnumToJSONInstance :: Text -> [OASType] -> [Text]
generateEnumToJSONInstance name types =
  [ ""
  , "instance ToJSON " <> name <> " where"
  , "  toJSON = \\case"
  ]
    ++ variantSerializers
 where
  variantSerializers = zipWith makeVariantSerializer [1 ..] types

  makeVariantSerializer :: Int -> OASType -> Text
  makeVariantSerializer i _ =
    let
      constructorName = name <> "Variant" <> T.pack (show i)
      typeName = "variant" <> T.pack (show i)
      paramName = "v" <> T.pack (show i)
    in
      "    "
        <> constructorName
        <> " "
        <> paramName
        <> " -> object [\"type\" .= (\""
        <> typeName
        <> "\" :: Text), \"value\" .= "
        <> paramName
        <> "]"

-- | Convert a SchemaResult to a type string
schemaResultToType :: SchemaResult -> Text
schemaResultToType EmptySchema = "()"
schemaResultToType (Type ty) = getTypeReference ty

-- | Create a name for an endpoint
makeEndpointName :: Endpoint -> Text
makeEndpointName endpoint =
  let
    -- Remove special characters from path
    sanitizedPath = T.map (\c -> if c `elem` ("/{}" :: String) then '_' else c) endpoint.path

    -- Create camel case name with HTTP method prefix
    methodPrefix = T.toLower $ T.pack $ show endpoint.method
  in
    methodPrefix <> T.toTitle sanitizedPath

-- | Generate a client module that exports all types and endpoints
generateClientModule :: FilePath -> Modules -> IO ()
generateClientModule rootDir modules = do
  let
    clientFilePath = rootDir </> "Client.hs"

  -- Collect all type modules
  let
    typeModules = S.fromList $ map (T.intercalate ".") $ M.elems modules.typeModule

  -- Collect all endpoint modules
  let
    endpointModules = S.fromList $ map (T.intercalate ".") $ M.elems modules.endpointModule

  -- All modules to export
  let
    allModules = S.toList (typeModules `S.union` endpointModules)

  -- Create the client module
  let
    moduleExports = T.intercalate "\n  , module " allModules
    moduleImports = T.unlines $ ("import " <>) <$> allModules

    clientContent =
      T.unlines
        [ "module Client"
        , "  ( module " <> moduleExports
        , "  ) where"
        , ""
        , moduleImports
        ]

  TIO.writeFile clientFilePath clientContent
