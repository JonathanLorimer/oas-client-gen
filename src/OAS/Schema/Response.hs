{-# LANGUAGE StrictData #-}

module OAS.Schema.Response where

import Data.Map.Strict (Map)
import Data.Text (Text)
import Network.HTTP.Types.Status (Status)
import OAS.Schema.Header (Header, MediaType)
import OAS.Schema.Link (Link)
import OAS.Schema.Ref (OrRef)

data Response = Response
  { description :: Text
  , headers :: Map Text (OrRef Header)
  , content :: Map Text MediaType
  , links :: Map Text (OrRef Link)
  }

data ResponseType = Default | ForStatus Status

type Responses = Map ResponseType Response
