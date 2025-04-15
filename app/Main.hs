module Main where

import Control.Monad (join)
import Data.Aeson.Decoding (eitherDecode)
import Data.ByteString qualified as BS
import Data.Map qualified as M
import Data.Text (Text)
import Data.Traversable (for)
import OAS.Generator.Endpoints (Endpoint, fromPath)
import OAS.Generator.Environment (Environment (..), constructEnvironment, fromRef)
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
          endpoints :: Either Text [Endpoint] =
            join <$> for (M.toList p) \(url, orRef) -> do
              path <- fromRef env.paths orRef
              fromPath env url path

        pPrint endpoints
