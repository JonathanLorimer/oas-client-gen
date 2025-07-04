module Endpoints.Health where

import Data.Text (Text)
import qualified Data.Text as T
import Data.Foldable (fold)
import Data.Bifunctor (first, bimap)
import qualified Data.Aeson as A
import qualified Data.ByteString.Lazy as L
import OAS.Base.Endpoint (Endpoint(..), FromResponseError(..))
import qualified Network.HTTP.Types as HTTP


getHealth :: Endpoint () () ()
getHealth = Endpoint
  { method = GET
  , path = const $ fold
      [ "/health" ]
  , requestBody = const L.empty
  , responseBody = \_ _ -> ()
  }
