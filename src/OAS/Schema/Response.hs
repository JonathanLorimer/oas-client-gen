{-# LANGUAGE StrictData #-}

module OAS.Schema.Response where

import Data.Aeson
import Data.Aeson.Types (toJSONKeyText, typeMismatch)
import Data.Map.Strict (Map)
import Data.Text (Text)
import Data.Text qualified as T
import Deriving.Aeson
import Network.HTTP.Types.Status (Status)
import Numeric.Natural (Natural)
import OAS.Schema.Header (Header, MediaType)
import OAS.Schema.Link (Link)
import OAS.Schema.Ref (OrRef)
import Text.Read (readMaybe)

data Response = Response
  { description :: Text
  , headers :: Map Text (OrRef Header)
  , content :: Map Text MediaType
  , links :: Map Text (OrRef Link)
  }
  deriving (Show, Eq, Generic)
  deriving
    (FromJSON, ToJSON)
    via CustomJSON '[OmitNothingFields] Response

data ResponseType = Default | ForStatus Natural
  deriving (Eq, Ord, Show, Generic, FromJSONKey)

instance ToJSONKey ResponseType where
  toJSONKey = toJSONKeyText textFunc
   where
    textFunc :: ResponseType -> Text
    textFunc Default = "default"
    textFunc (ForStatus n) = T.pack (show n)

instance FromJSON ResponseType where
  parseJSON (String "default") = pure Default
  parseJSON (String s) =
    maybe
      (fail $ "Invalid status code: " ++ show s)
      (pure . ForStatus)
      (readMaybe $ T.unpack s)
  parseJSON (Number n) = pure $ ForStatus $ fromIntegral (floor n :: Integer)
  parseJSON invalid = typeMismatch "ResponseType" invalid

instance ToJSON ResponseType where
  toJSON Default = String "default"
  toJSON (ForStatus status) = toJSON (show status)

type Responses = Map ResponseType Response
