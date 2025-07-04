{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE OverloadedStrings #-}

module Types.InvalidateAccessTokenResponse where

import Data.Text (Text)
import Data.Aeson
import Data.Aeson.Types (Value(..), Parser)
import Control.Applicative


data InvalidateAccessTokenResponse = InvalidateAccessTokenResponse
  { newAccessToken :: Text
  }
  deriving (Show, Eq)

instance FromJSON InvalidateAccessTokenResponse where
  parseJSON = withObject "InvalidateAccessTokenResponse" $ \obj -> do
    newAccessToken <- obj .: "new_access_token"
    pure $ InvalidateAccessTokenResponse{..}

instance ToJSON InvalidateAccessTokenResponse where
  toJSON InvalidateAccessTokenResponse{..} =
    object [
      "new_access_token" .= newAccessToken
    ]
