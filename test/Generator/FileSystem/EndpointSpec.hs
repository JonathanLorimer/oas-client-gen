{-# LANGUAGE ImportQualifiedPost #-}

module Generator.FileSystem.EndpointSpec where

import Data.Map qualified as M
import Data.Text qualified as T
import Network.HTTP.Types (StdMethod (..))
import OAS.Generator.Endpoint (Endpoint (..), ResponseTypeInfo (..))
import OAS.Generator.FileSystem.Endpoint (generateEndpointDefinition)
import OAS.Generator.OASType (Key (..), OASPrimTy (..), OASType (..), Record (..), SchemaResult (..))
import OAS.Schema.Response (ResponseType (..))
import Test.Hspec
import Test.Hspec.Golden

spec :: Spec
spec = describe "generateEndpointDefinition" $ do
  golden "simple-get-endpoint" $ do
    pure $ T.unpack $ generateEndpointDefinition simpleGetEndpoint

  golden "post-endpoint-with-bodies" $ do
    pure $ T.unpack $ generateEndpointDefinition postEndpointWithBodies

  golden "endpoint-with-path-params" $ do
    pure $ T.unpack $ generateEndpointDefinition endpointWithPathParams

-- Test data
simpleGetEndpoint :: Endpoint
simpleGetEndpoint =
  Endpoint
    { method = GET
    , path = "/health"
    , requestType = Nothing
    , responseType = UnaryType (ForStatus 200) (Type $ OASPrim PrimString)
    }

postEndpointWithBodies :: Endpoint
postEndpointWithBodies =
  Endpoint
    { method = POST
    , path = "/predict"
    , requestType =
        Just $
          OASObject $
            Record
              { constructor = "InputData"
              , fields = M.fromList [(Key "input_string" "InputString", OASPrim PrimString)]
              }
    , responseType = UnaryType (ForStatus 200) EmptySchema
    }

endpointWithPathParams :: Endpoint
endpointWithPathParams =
  Endpoint
    { method = GET
    , path = "/users/{userId}/posts/{postId}"
    , requestType = Nothing
    , responseType = UnaryType (ForStatus 200) EmptySchema
    }
