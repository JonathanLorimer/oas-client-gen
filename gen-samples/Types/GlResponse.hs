module Types.GlResponse where

import Data.Text (Text)
import Data.Aeson (FromJSON(..), ToJSON(..), (.=), (.:), (.:?), withObject, object)
import Data.Aeson.Types (Value(..), Parser, asum)
import GHC.Generics (Generic)


data GlResponse = GlResponse
  { outputString :: Text
  }
  deriving (Show, Eq)

instance FromJSON GlResponse where
  parseJSON = withObject "GlResponse" $ \obj -> do
    outputString <- obj .: "output_string"
    pure $ GlResponse{..}

instance ToJSON GlResponse where
  toJSON GlResponse{..} =
    object [
      "output_string" .= outputString
    ]
