module Endpoints.Predict where

import Data.Text (Text)
import qualified Data.Text as T
import Data.Foldable (fold)
import Data.Bifunctor (first, bimap)
import qualified Data.Aeson as A
import qualified Data.ByteString.Lazy as L
import OAS.Base.Endpoint (Endpoint(..), FromResponseError(..))
import qualified Network.HTTP.Types as HTTP

import Types.GlResponse (GlResponse)
import Types.HttpValidationError (HttpValidationError)
import Types.InputData (InputData)
import Types.ValidationError (ValidationError)
import Types.Location (Location)

data PostPredictResponse = PostPredictResponseForStatus200 GlResponse
  | PostPredictResponseForStatus422 HttpValidationError
  deriving (Eq, Show)

postPredict :: Endpoint () InputData PostPredictResponse
postPredict = Endpoint
  { method = POST
  , path = const $ fold
      [ "/predict" ]
  , requestBody = A.encode
  , responseBody = \case
      200 -> \bs -> bimap (ParseError 200) PostPredictResponseForStatus200 $ A.eitherDecode bs
      422 -> \bs -> bimap (ParseError 422) PostPredictResponseForStatus422 $ A.eitherDecode bs
      s -> \bs -> Left $ UnexpectedResponse s bs
  }
