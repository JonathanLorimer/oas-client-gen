module Main where

import Data.Aeson.Decoding (eitherDecode)
import Data.ByteString qualified as BS
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
    Right parsed -> do
      print "COMPONENTS"
      pPrint parsed.components

      print "PATHS"
      pPrint parsed.paths
