module OAS.Aeson.Modifiers where

import Data.Char (toLower)
import Deriving.Aeson

data ToLower

instance StringModifier ToLower where
  getStringModifier = fmap toLower

data LowerFirst

instance StringModifier LowerFirst where
  getStringModifier "" = ""
  getStringModifier (x : xs) = toLower x : xs
