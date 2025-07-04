module Main where

import Control.Monad (join)
import Data.Aeson.Decoding (eitherDecode)
import Data.ByteString qualified as BS
import Data.Map qualified as M
import Data.Text (Text)
import Data.Traversable (for)
import OAS.Generator.Endpoint (Endpoint, fromPath)
import OAS.Generator.Environment (Environment (..), constructEnvironment, fromRef)
import OAS.Generator.FileSystem (OutputDir (..), generateFiles)
import OAS.Generator.Module (makeModules)
import OAS.Generator.OASType (emptyTypeGraph, fromRefSchemaT, runSchemaT)
import OAS.Schema.OpenAPI (OpenAPISpec (..))
import System.Environment (getArgs)
import System.IO (IOMode (..), withFile)
import Text.Pretty.Simple (pPrint)
import Prelude

-- TODO: write an actual CLI using optparse applicative
main :: IO ()
main = do
  args <- getArgs
  case args of
    [specFile, outputDir] -> generateClient specFile outputDir
    [specFile] -> generateClient specFile "./generated"
    _ -> putStrLn "Usage: oas-client-gen <openapi-spec.json> [output-directory]"

generateClient :: FilePath -> FilePath -> IO ()
generateClient specFile outputDir = do
  result <- withFile specFile ReadMode BS.hGetContents
  case eitherDecode @OpenAPISpec . BS.fromStrict $ result of
    Left err -> putStrLn $ "Error parsing OpenAPI spec: " ++ err
    Right parsed -> case parsed.paths of
      Nothing -> putStrLn "No paths found in OpenAPI spec"
      Just p -> do
        let
          env = constructEnvironment parsed.components
        (eitherEps, tyInfo) <-
          flip runSchemaT emptyTypeGraph $
            join <$> for (M.toList p) \(url, orRef) -> do
              path <- fromRefSchemaT env.paths orRef
              fromPath env url path

        case eitherEps of
          Right eps -> do
            let
              modules = makeModules eps tyInfo

            putStrLn $ "Generating Haskell client in " ++ outputDir
            generateFiles (OutputDir outputDir) modules
            putStrLn "Client generation complete!"
          Left err -> do
            putStrLn "Error processing OpenAPI spec:"
            pPrint err
