module Types.InputData where

import Data.Text (Text)
import Data.Aeson (FromJSON(..), ToJSON(..), (.=), (.:), (.:?), withObject, object)
import Data.Aeson.Types (Value(..), Parser, asum)
import GHC.Generics (Generic)


data InputData = InputData
  { inputString :: Text
  }
  deriving (Show, Eq)

instance FromJSON InputData where
  parseJSON = withObject "InputData" $ \obj -> do
    inputString <- obj .: "input_string"
    pure $ InputData{..}

instance ToJSON InputData where
  toJSON InputData{..} =
    object [
      "input_string" .= inputString
    ]
