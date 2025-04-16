module Main where

import Control.Monad (join)
import Data.Aeson.Decoding (eitherDecode)
import Data.ByteString qualified as BS
import Data.Map qualified as M
import Data.Text (Text)
import Data.Traversable (for)
import OAS.Generator.Endpoint (Endpoint, fromPath)
import OAS.Generator.Environment (Environment (..), constructEnvironment, fromRef)
import OAS.Generator.Module (makeModules)
import OAS.Generator.OASType (emptyTypeGraph, fromRefSchemaT, runSchemaT)
import OAS.Schema.OpenAPI (OpenAPISpec (..))
import System.IO (IOMode (..), withFile)
import Text.Pretty.Simple (pPrint)
import Prelude

main :: IO ()
main = do
  result <-
    withFile "./spec-samples/autocat-openapi.json" ReadMode BS.hGetContents
  case eitherDecode @OpenAPISpec . BS.fromStrict $ result of
    Left err -> print err
    Right parsed -> case parsed.paths of
      Nothing -> print "No Paths"
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

            pPrint modules
          Left err -> pPrint err
