{-# LANGUAGE StrictData #-}

module OAS.Schema.Server where

import Data.List.NonEmpty (NonEmpty)
import Data.Map.Strict (Map)
import Data.Text (Text)

-- | <https://swagger.io/specification/#server-object>
data Server = Server
  { url :: Text
  , description :: Maybe Text
  , variables :: Map Text ServerVariable
  }

data ServerVariable = ServerVariable
  { enum :: Maybe (NonEmpty Text)
  , def :: Text
  , description :: Maybe Text
  }
