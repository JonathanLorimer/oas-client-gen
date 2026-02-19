module Main where

import Control.Monad (join)
import Control.Monad.IO.Class (liftIO)
import Data.Aeson.Decoding (eitherDecode)
import Data.ByteString qualified as BS
import Data.Map qualified as M
import Data.Set qualified as S
import Data.Text (Text)
import Data.Text qualified as T
import Data.Traversable (for)
import OAS.Generator.Endpoint (Endpoint, fromPath)
import OAS.Generator.Environment (Environment (..), constructEnvironment, fromRef)
import OAS.Generator.FileSystem (OutputDir (..), generateFiles)
import OAS.Generator.Module (makeModules)
import OAS.Generator.OASType (TypeInfo(..), emptyTypeGraph, fromRefSchemaT, runSchemaT)
import OAS.Schema.OpenAPI (OpenAPISpec (..))
import System.Environment (getArgs)
import System.IO (IOMode (..), withFile, hFlush, stdout)
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
  putStrLn $ "Loading OpenAPI spec from: " ++ specFile
  hFlush stdout
  result <- withFile specFile ReadMode BS.hGetContents
  putStrLn $ "Read " ++ show (BS.length result) ++ " bytes"
  hFlush stdout
  putStrLn "Parsing JSON..."
  hFlush stdout
  case eitherDecode @OpenAPISpec . BS.fromStrict $ result of
    Left err -> putStrLn $ "Error parsing OpenAPI spec: " ++ err
    Right parsed -> case parsed.paths of
      Nothing -> putStrLn "No paths found in OpenAPI spec"
      Just p -> do
        putStrLn $ "Found " ++ show (M.size p) ++ " paths in OpenAPI spec"
        let
          env = constructEnvironment parsed.components
          pathList = M.toList p
          
        putStrLn "Processing paths..."
        (eitherEps, tyInfo) <-
          flip runSchemaT emptyTypeGraph $ do
            allEndpoints <- for (zip [1..] pathList) \(idx, (url, orRef)) -> do
              liftIO $ putStrLn $ "[" ++ show idx ++ "/" ++ show (length pathList) ++ "] Processing: " ++ T.unpack url
              liftIO $ hFlush stdout
              path <- fromRefSchemaT env.paths orRef
              liftIO $ putStrLn $ "  -> Path resolved, processing operations..."
              liftIO $ hFlush stdout
              endpoints <- fromPath env url path
              liftIO $ putStrLn $ "  -> Found " ++ show (length endpoints) ++ " endpoints"
              liftIO $ hFlush stdout
              pure endpoints
            pure $ join allEndpoints

        case eitherEps of
          Right eps -> do
            putStrLn $ "Successfully processed " ++ show (length eps) ++ " endpoints"
            putStrLn $ "Found " ++ show (S.size tyInfo.types) ++ " types"
            let
              modules = makeModules eps tyInfo

            putStrLn $ "Generating Haskell client in " ++ outputDir
            generateFiles (OutputDir outputDir) modules
            putStrLn "Client generation complete!"
          Left err -> do
            putStrLn "Error processing OpenAPI spec:"
            pPrint err
