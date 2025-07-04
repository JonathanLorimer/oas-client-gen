module Types.Location where

import Data.Text (Text)
import Data.Aeson (FromJSON(..), ToJSON(..), (.=), (.:), (.:?), withObject, object)
import Data.Aeson.Types (Value(..), Parser, asum)
import GHC.Generics (Generic)


data Location
  = LocationVariant1 Text
  | LocationVariant2 Int
  deriving (Show, Eq, Generic)

instance FromJSON Location where
  parseJSON value = asum
    [ LocationVariant1 <$> parseJSON value
    , LocationVariant2 <$> parseJSON value
    ]

instance ToJSON Location where
  toJSON = \case
    LocationVariant1 v1 -> object ["type" .= ("variant1" :: Text), "value" .= v1]
    LocationVariant2 v2 -> object ["type" .= ("variant2" :: Text), "value" .= v2]
