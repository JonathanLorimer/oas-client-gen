{-# LANGUAGE StrictData #-}

module OAS.Schema.Server where

import Data.List.NonEmpty (NonEmpty)
import Data.Map.Strict (Map)
import Data.Text (Text)
import Deriving.Aeson

-- | <https://swagger.io/specification/#server-object>
data Server = Server
  { url :: Text
  , description :: Maybe Text
  , variables :: Maybe (Map Text ServerVariable)
  }
  deriving (Show, Eq, Generic)
  deriving
    (FromJSON, ToJSON)
    via CustomJSON '[OmitNothingFields] Server

data ServerVariable = ServerVariable
  { enum :: Maybe (NonEmpty Text)
  , def :: Text
  , description :: Maybe Text
  }
  deriving (Show, Eq, Generic)
  deriving
    (FromJSON, ToJSON)
    via CustomJSON '[OmitNothingFields] ServerVariable
